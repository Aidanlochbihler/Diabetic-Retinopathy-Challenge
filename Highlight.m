for r = 31:31
    rgbImage = imread(['/Users/aidanlochbihler/retinadata/Original/IDRiD_',num2str(r),'.jpg']);
    %mask = imread(['/Users/aidanlochbihler/retinadata/Image',num2str(r),'.jpg']);
    h1 = imshow(rgbImage); 
    hold on

    mask = imread(['/Users/aidanlochbihler/retinadata/Prediction/PredictOCRemoved',num2str(r),'.png']);
    [x,y,z] = size(mask);
    if z ==3
        mask  = mask(:,:,1);
        size(mask);
    end
    O = reshape(mask, 2816, 3584, 1);
    X1 = ones(2816, 3584, 1)*0;
    X2 = ones(2816, 3584, 1)*0;
    X = cat(3,X1,X2,O); %RGB, Array O is 255, X1&X2 are 0
    h2 = imshow(X);
    set(h2, 'AlphaData', mask*0.8);
    set(gcf,'color','black');

    hold on

    h3 = imread(['/Users/aidanlochbihler/retinadata/Ground Truth/IDRiD_',num2str(r),'_EX.tif']);
    [c, hc] = imcontour(h3,3);
    hc.LineWidth = 0.8;
    hc.LineColor = 'r';

    hold off

    hAxes = gca;
    hAxes.XRuler.Axle.LineStyle = 'none';  
    axis off

    saveas(gcf,['/Users/aidanlochbihler/retinadata/Final/Image',num2str(r),'.png']);
    
    close all
end
