clear;
%load data
d = load('datingTestSet2.txt');
%normalize








hoRatio = 0.1;
m = length(d);
n = size(d, 2);
test_m = hoRatio*m;
train_m = (1-hoRatio)*m;
test_d = d(1:test_m,:);
train_d = d(test_m+1:m,:);
testrs_d = test_d(:,n);
trainrs_d = train_d(:,n);

count_map = containers.Map(unique(trainrs_d), zeros(length(unique(trainrs_d)),1));

%knn
k = 3;
error = 0;
for i=1:test_m
    vec = d(i,:);
    vec_input_extend = repmat(vec(:,1:3), [train_m,1]);
    train_input = train_d(:,1:3);
    sub = train_input-vec_input_extend;
    distance = sqrt(sum((sub.^2)')');
    [sorted_distance,index] = sort(distance);
    for j=1:k
        label = trainrs_d(index(k)) ;
        count_map(label) = count_map(label) + 1;
    end
    keys = cell2mat(count_map.keys);
    values = cell2mat(count_map.values);
    [sorted_values,index2] = sort(-values);
    c_label(i) = keys(index2(1))
    if testrs_d(i) ~= c_label(i)
        error = error+1;
    end
end

result = [c_label', testrs_d];
accuracy = (test_m-error)/test_m