%% Subtract mediator background from data
% close all;
% clc;
% base=med_data(2).spectra_final;
function spectra_out=subtractmeds(lambda,spectra,base,synch,cat_ano)

[~, lambdapoint]=min(abs(lambda-650));

ratio=spectra(lambdapoint,synch)./base(lambdapoint,:);
ratio2=(spectra(lambdapoint,synch)-base(lambdapoint,:))./spectra(lambdapoint,synch);

% figure()
% plot(1:21,ratio)

f=0;
if cat_ano==1
    f=mean(ratio(1:1+3));
else
    f=mean(ratio(end-3:end));
end

% 
% figure()
% plot(lambda,spectra(:,synch))
% hold on;
% plot(lambda,base,'k')
curves=spectra(:,synch)-base*f;
% figure()
% plot(lambda,curves,'r')


range=[700 745];
baselam=lambda<range(2) & lambda>range(1);
base2=mean(curves(baselam,:));
spectra2=curves-base2;
spectra_out=spectra2;
% figure()
% plot(lambda,spectra2)


end
