% A function that finds the isosbestic point for a given spectra near the
% alpha band. 

function isos=findisos(lambda,spectra,catano)
indexpts=1:length(lambda);
upperlim=565;
lowerlim=540;
alphapeak=552;
cutoff=7;
isos=[];
[~,upperind]=min(abs(lambda-upperlim));
[~,lowerind]=min(abs(lambda-lowerlim));
[~,alphaind]=min(abs(lambda-alphapeak));

sd=std(spectra,0,2);

[val,inds]=min(sd(lowerind:alphaind));
temp=indexpts(lowerind:alphaind);
point1=temp(inds);


[val,inds]=min(sd(alphaind:upperind));
temp=indexpts(alphaind:upperind);
point2=temp(inds);


%if there is too much background then just use published points
if lambda(point2)-lambda(point1)<=cutoff;
   if catano
       isbs=[543 562];
       dif=lambda-isbs;
       [~, index]=min(abs(dif));
       isos=[index(1),index(2)];
   else
       isbs=[545 559];
       dif=lambda-isbs;
       [~, index]=min(abs(dif));
       isos=[index(1),index(2)];
   end 
else
    isos=[point1 point2];
end
figure()
plot(lambda,sd)
hold on;
plot(lambda(isos),sd(isos),'*r')
lambda(isos)

% for i=flip(lowerind:alphaind)
%     
%     if dif(i)<=cutoff*mval
%         isoslow=i;      
%     end
% end
% for i=alphaind:upperind
%     
%     if dif(i)<=cutoff*mval
%         isoshigh=i;      
%     end
% end
% 
% isos=[isoslow isoshigh];
% lambda(isos)
end