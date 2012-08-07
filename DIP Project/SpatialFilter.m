function FltrIm=SpatialFilter(Im,Mask) 
[M N]=size(Im); 
[m n]=size(Mask); 
a=(m-1)/2; 
b=(n-1)/2; 
g=zeros(M,N); 
for x=1:M, 
    for y=1:N, 
        for s=-a:a, 
            for t=-b:b 
                if((x+s)>0 && (y+t)>0 && (x+s)<=M && (y+t)<=N) 
                    g(x,y)=g(x,y)+ Mask(s+a+1,t+b+1) *Im(x+s,y+t); 
                end 
            end 
           
        end 
    end 
end 

FltrIm=g; 
