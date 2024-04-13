function [mu,Ud,Y]= pca(X,d)
% PCA Compute PCA on data array X using Singular Value Decomposition (SVD)
% 
% [mu, Ud,Y] = pca(X,d) computes PCA on D-by-N array X with columns representing individual
% observations and rows features. mu is the row mean of X, Ud an
% orthonormal basis for subspace, and Y the first principal components
% of X. By default, PCA centers the data.

    % calculate means of data
    mu = mean(X,2);
    % Center data by subtracting out mean
    X_c = X-mu;
    % Find orthonormal basis using singular value
    % decomposition
    [U,~,~] = svd(X_c,'econ');
    % Return first d eigenvectors
    Ud = U(:,1:d);
    % Return first d principal components as column vectors
    Y = (Ud'*X_c)';
end
