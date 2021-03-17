% clear all, clc, close all
% [images, labels] = mnist_parse('train-images.idx3-ubyte', 'train-labels.idx1-ubyte');
% images = reshape(images, [28*28], 60000);
% images = double(images);
% [U, S, V] = svd(images, 'econ');
% figure(1)
% for k = 1:9
%     subplot(3,3,k)
%     ut1 = reshape(U(:,k),28,28);
%     ut2 = rescale(ut1);
%     imshow(ut2)
% end
% figure(2)
% plot(diag(S)/sum(diag(S)), 'r*','Linewidth',[2] )
% ylabel('Singular Value')
% xlabel('Images')
% title('Singular Value Spectrum')
% 
% % Projection onto 3 V-modes
% figure(3)
% for label = 0:9
%     label_ind = find(labels == label);
%     plot3(V(label_ind, 2), V(label_ind, 3), V(label_ind, 5),...
%         'o','DisplayName', sprintf('%i', label), 'Linewidth', 1);
%     hold on
% end
% xlabel('2nd V-Mode'), ylabel('3rd V-Mode'), zlabel('5th V-Mode')
% title('Projection onto V-modes 2, 3, 5')
% legend
% set(gca, 'Fontsize', 14)
% rank = 10
% proj = S*V';
% % figure(4)
% % feature = 10;
% % U_new = U(:, 1:10);
% % for k = 1:9
% %     subplot(3,3,k)
% %     ut1 = reshape(U_new(:,k),28,28);
% %     ut2 = rescale(ut1);
% %     imshow(ut2)
% % end
% % nd = size(images, 2);
% % proj = S*V';
% % final = proj(1:feature, 1:nd);
% % nd = mean(final, 2)
% % Sw = 0;
% % for k = 1:nd
% %     Sw = Sw +(images(:,k) - nd)*(images(:,k)-nd)';
% % end
% [test_images, test_labels] = mnist_parse('t10k-images.idx3-ubyte', 't10k-labels.idx1-ubyte');
% test_images = reshape(test_images, [28*28], 10000);
% test_images = double(test_images);
% % classification tree
% % tree = fitctree(images, labels, 'MaxNumSplits',3,'CrossVal','on');
% Md1 = fitcsvm(images, labels);
% label = predict(Md1, test_images)
% good = 0;
% for i = 1:length(label)
%     if label(i) == test_labels(i)
%         good = good + 1;
%     end
% end
% accuracy = good/rank;
% print('Accuracy of SVM is', num2str(accuracy));
% 
% wave = dc_wavelet(images);
% pca = U'*wave;
% val = w'*pca;

    



% new = U*S(:,1:200)*V(:,1:200)';


% reconstr = U*S(:, 1:50)*V(:, 1:50)';
% img = [2, 50, 100];
% for i = 1:length(img)
%     imshow(unit8(reshape(reconstr(:,img(i), [28*28], 1))));
% end