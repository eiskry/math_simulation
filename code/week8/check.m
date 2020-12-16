function p = check(W,test_X,test_Y)
[~,I1] = max(W*test_X);
[~,I2] = max(test_Y);
[~,m] = size(I1);
p = sum((I1-I2)==0)/m;
