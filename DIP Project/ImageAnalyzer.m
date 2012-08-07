
function varargout = ImageAnalyzer(varargin)
% IMAGEANALYZER M-file for ImageAnalyzer.fig
%      IMAGEANALYZER, by itself, creates a new IMAGEANALYZER or raises the existing
%      singleton*.
%
%      H = IMAGEANALYZER returns the handle to a new IMAGEANALYZER or the handle to
%      the existing singleton*.
%
%      IMAGEANALYZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEANALYZER.M with the given input arguments.
%
%      IMAGEANALYZER('Property','Value',...) creates a new IMAGEANALYZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageAnalyzer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageAnalyzer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageAnalyzer

% Last Modified by GUIDE v2.5 30-Dec-2011 05:25:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageAnalyzer_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageAnalyzer_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ImageAnalyzer is made visible.
function ImageAnalyzer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageAnalyzer (see VARARGIN)

% Choose default command line output for ImageAnalyzer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageAnalyzer wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global address;
address=0;

global uipanel2Value;
uipanel2Value='spatial';
 
global sliderValue;
sliderValue=1;

global uipanel3Value;
uipanel3Value='Horizontal';

global sliderValueF;
sliderValueF=0.005;

global img;

global previ;
previ=1;

global previi;
previi=50;

% --- Outputs from this function are returned to the command line.
function varargout = ImageAnalyzer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider1, 'Value',0);
[FileName,PathName,FilterIndex] = uigetfile('*.jpg');
if ~strcmp(PathName,'')
    
display(strcat(PathName,FileName));
display(FileName);
display(FilterIndex);
global address;
var = strcat(PathName,FileName);
address =var;
img=rgb2gray(imread(address));
[r c] = size(img);
%set(handles.axes2,'Visible','off');
%set(handles.axes2,'UserData',image(img));

axes(handles.axes6);

imhist(img);  

axes(handles.axes2);  % for focusing on this axes , wasted alot of my time :(
colormap('gray');
imshow(img);
%image(img);

set(handles.text6,'String','Image Loaded');

end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function asdf_Callback(hObject, eventdata, handles)
% hObject    handle to asdf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
[file,path] = uiputfile('*.jpg');

F=getframe(handles.figure1); %select axes in GUI
    %figure(); %new figure
    %image(F.cdata); %show selected axes in new figure
    saveas(gcf, strcat(path,file),'jpg'); %save figure
    %close(gcf); %and close it

% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array

%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global uipanel2Value;
set(handles.slider1, 'Value',0);
if strcmp(uipanel2Value,'frequency')
set(handles.slider1, 'Value',50); 
end

global sliderValue;
sliderValue=1;
global sliderValueF;
sliderValueF =0.005;


display('called');
val=get(handles.popupmenu1,'Value');
display(val);
switch(val)
    
    case 6
        set(handles.uipanel3,'Visible','on');
        
    otherwise    
        set(handles.uipanel3,'Visible','off');
end
    


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on key press with focus on popupmenu1 and none of its controls.
function popupmenu1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

set(handles.slider1, 'Value',0); 
global uipanel2Value;

global sliderValue;
sliderValue=1;

global sliderValueF;
sliderValueF =0.005;

val = get(eventdata.NewValue,'Tag');
uipanel2Value =val;
set(hObject,'Tag',val);
val2=get(hObject,'Tag');
display(val2);
display(val);
forSpatial= {'Mean' 'Median' 'Laplacian'  'Prewitt' 'LoG' 'Line Detection' 'Standard Deviation' 'Variance' 'Entropy' 'Histogram Equalization'};
forFrequency ={'Ideal Low Pass' 'Ideal High Pass' 'Butterworth Low' 'Butterworth High'};

%display(get(handles.popupmenu1,'String'));
switch (val)
    case 'spatial'
    set(handles.popupmenu1, 'value', 1);    
    set(handles.popupmenu1,'String',forSpatial);
    case 'frequency'
        set(handles.slider1, 'Value',50); 
    set(handles.popupmenu1, 'value', 2);    
    set(handles.popupmenu1,'String',forFrequency);    
        
end
    


% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel3 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global uipanel3Value;
uipanel3Value = get(eventdata.NewValue,'Tag');

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3

% global address;
% if address~=0 
% 
% 
% img = imread(address);
% [r c] = size(img);
% axes(hObject);
% image(img);
% 
% end
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global address;
global uipanel2Value;
global sliderValue;
global uipanel3Value;
global sliderValueF;
global previ;

if get(handles.slider1,'Value')>=previ && sliderValue<99
   previ=get(handles.slider1,'Value');
   sliderValue=sliderValue+ 2; % denomiator for filter
    
end


if get(handles.slider1,'Value')<previ && sliderValue>1 
   previ=get(handles.slider1,'Value');
   sliderValue=sliderValue-2; % denomiator for filter
    
end

%sliderValue=sliderValue+ 2; % denomiator for filter 
global previi;

if get(handles.slider1,'Value') >= previi 
sliderValueF= sliderValueF*1.3; % fixing threshold
previi=get(handles.slider1,'Value');
end

if get(handles.slider1,'Value') < previi  
sliderValueF= sliderValueF/1.3; % fixing threshold 
previi=get(handles.slider1,'Value');
end



if address~=0 
% 
% v=get(hObject, 'Value');
% img = imread(address);
% [r c] = size(img);
% axes(handles.axes3);
% image(img*v);

img = rgb2gray(imread(address)); 



%figure , imshow(image);
[r c]=size(img);

newImage = zeros(r+2,c+2); % for zero padding 
newImage(2:r+1,2:c+1)=img;

%for mirror padding 

newImage(1,2:c+1)=img(r,1:c);
newImage(r+1,2:c+1)=img(1,1:c);

newImage(2:r+1,1)=img(1:r,c);
newImage(2:r+1,c+1)=img(1:r,1);

newImage(1,1)=img(r,c);
newImage(r+1,c+1)=img(1,1);

newImage(r+1,1)=img(1,c);
newImage(1,c+1)=img(r,1);
display(uipanel2Value);

val=get(handles.popupmenu1,'Value');
display(val);
if strcmp(uipanel2Value,'spatial')


    switch (val)
        
        case 1
        %% AVERAGE MEAN FILTER SECTION
 set(handles.text8,'Visible','on');
           % img = rgb2gray(imread(address));
            display(val);

set(handles.text6,'String','Processing');

filterAuto=ones(sliderValue,sliderValue);
denomi =sliderValue*sliderValue;

kernel = num2str(sliderValue);
kernell =[kernel ' X ' kernel];
val= get(handles.slider1,'Value');
set(handles.text7,'String',kernell);

filterAuto= filterAuto/denomi; 
filterAuto
sliderValue
denomi
filter3x3 = [1/9 1/9 1/9 ;1/9 1/9 1/9 ;1/9 1/9 1/9]; % Average Mean Filter 


n = SpatialFilter(newImage,filterAuto);
%im = SpatialFilter(newImage,filter3x3);

row=r;
col=c;

% for i=2:row+1
%     for j=2:col+1
%         
%         aa = newImage(i,j) ; 
%         bb = newImage(i+1,j);
%         cc = newImage(i-1,j);
%         ImageAnalyzer = newImage(i,j+1) ;
%         ee = newImage(i,j-1) ;
%         ff=newImage(i-1,j-1) ;
%         gg=newImage(i-1,j+1);
%         hh=newImage(i+1,j-1);
%         ii=newImage(i+1,j+1) ;
%         
%         val= aa+bb+cc+ImageAnalyzer+ee+ff+gg+hh+ii;
%         newImage(i,j)=val/9;
%         
% 
%     end
% end
% 
% figure , imshow(newImage,[]);
% figure , imshow(im,[]);
% figure ,imshow(n , []);
axes(handles.axes3);
image(n); 


axes(handles.axes5);
hist(n);  
set(handles.text6,'String','Processing Completed');
display ('MEAN FILTER END');        
    % figure , hist(n);   
        
        case 2 
        %% MEDIAN FILTER SECTION
       set(handles.text8,'Visible','on');     
%img = rgb2gray(imread(address));
set(handles.text6,'String','Processing');
filterAuto=ones(sliderValue,sliderValue);
denomi =sliderValue*sliderValue;
filterAuto= filterAuto/denomi; 

kernel = num2str(sliderValue);
kernell =[kernel ' X ' kernel];


set(handles.text7,'String',kernell);



filterAuto
sliderValue
denomi

n = SpatialFilter_Median(newImage,filterAuto);
 

% row=r;
% col=c;
% 
% for i=3:row
%     for j=3:col
%         
%         aa = newImage(i,j) ; 
%         bb = newImage(i+1,j);
%         cc = newImage(i-1,j);
%         ImageAnalyzer = newImage(i,j+1) ;
%         ee = newImage(i,j-1) ;
%         ff=newImage(i-1,j-1) ;
%         gg=newImage(i-1,j+1);
%         hh=newImage(i+1,j-1);
%         ii=newImage(i+1,j+1) ;
%         
%         jj=newImage(i-2,j-2);
%         kk=newImage(i-1,j-2);
%         ll=newImage(i,j-2);
%         mm=newImage(i+1,j-2);
%         nn=newImage(i+2,j-2);
%         
%         oo=newImage(i-2,j+2);
%         pp=newImage(i-1,j+2);
%         qq=newImage(i,j+2);
%         rr=newImage(i+1,j+2);
%         ss=newImage(i+2,j+2);
%         
%         tt=newImage(i-2,j-1);
%         uu=newImage(i-2,j);
%         vv=newImage(i-2,j+1);
%         
%         ww=newImage(i+2,j-1);
%         xx=newImage(i+2,j);
%         yy=newImage(i+2,j+1);
%         
%      
%         array=[aa,bb,cc,ImageAnalyzer,ee,ff,gg,hh,ii,jj,kk,ll,mm,nn,oo,pp,qq,rr,ss,tt,uu,vv,ww,xx,yy];
%         val= median(array);
%         
%         newImage(i,j)=val;
%         
% 
%     end
% end
% 
% figure , imshow(newImage,[]);

axes(handles.axes3);
image(n);         


axes(handles.axes5);
hist(n);  
set(handles.text6,'String','Processing Completed');
display ('MEDIAN FILTER END');


        case 3
            %% 'Laplacian' FILTER SECTION
            set(handles.text8,'Visible','on');
            %image = rgb2gray(imread('g:\zeldag.jpg'));
% image = im2double(imread('g:\zeldag.jpg'));
% figure , imshow(image);
% [r c]=size(image);

% newImage = zeros(r+2,c+2); % for zero padding 
% newImage(2:r+1,2:c+1)=image;
% 
% %for mirror padding 
% 
% newImage(1,2:c+1)=image(r,1:c);
% newImage(r+1,2:c+1)=image(1,1:c);
% 
% newImage(2:r+1,1)=image(1:r,c);
% newImage(2:r+1,c+1)=image(1:r,1);
% 
% newImage(1,1)=image(r,c);
% newImage(r+1,c+1)=image(1,1);
% 
% newImage(r+1,1)=image(1,c);
% newImage(1,c+1)=image(r,1);


set(handles.text6,'String','Processing');
filterAuto=ones(sliderValue,sliderValue);
denomi =(sliderValue-1)/2 + 1;
d = -1;
filterAuto=filterAuto/d;
filterAuto(denomi,denomi)= sliderValue*sliderValue -1; 

kernel = num2str(sliderValue);
kernell =[kernel ' X ' kernel];
set(handles.text7,'String',kernell);


filterAuto
sliderValue
denomi

row=r;
col=c;

filter = [-1 -1 -1;-1 8 -1;-1 -1 -1];

n = SpatialFilter(newImage,filterAuto);
% newim=zeros(row,col);

% for i=2:row-1
%     for j=2:col-1
%         
%         aa = image(i,j) * 4; 
%         
%         bb = image(i+1,j) * filter(1,1);
%         
%         cc = image(i-1,j) * filter(1,1);
%         ImageAnalyzer = image(i,j+1) * filter(1,1);
%         ee = image(i,j-1) * filter(1,1);
%         
% %         ff=image(i-1,j-1) * filter(1,1);
% %         gg=image(i-1,j+1) * filter(1,1);
% %         hh=image(i+1,j-1) * filter(1,1);
% %         ii=image(i+1,j+1) * filter(1,1);
% %         
%         
        
            
        
%        val = aa +bb+ cc+ ImageAnalyzer +ee; %+ff +gg +hh +ii;
%        if(val<0)
%            val=0;
%        end
       
        
%         newim(i,j)= newim (i,j)+ val;
       
        

%     end
% end

% H = fspecial('laplacian');
% prewitted = imfilter(image,H);
% 
% figure ,imshow(prewitted);
% 
% image= uint8(newim*255);
% figure , imshow(image,[]);
axes(handles.axes3);
image(n);          


axes(handles.axes5);
hist(n);  
set(handles.text6,'String','Processing Completed');
display ('LAPLACIAN FILTER END');
            
        case 4 
            %% 'Prewitt' FILTER SECTION
set(handles.text8,'Visible','on');
            

% image = rgb2gray(imread('d:\img.jpg'));
% figure , imshow(image);
% [r c]=size(image);
% 
% newImage = zeros(r+2,c+2); % for zero padding 
% newImage(2:r+1,2:c+1)=image;
% 
% %for mirror padding 
% 
% newImage(1,2:c+1)=image(r,1:c);
% newImage(r+1,2:c+1)=image(1,1:c);
% 
% newImage(2:r+1,1)=image(1:r,c);
% newImage(2:r+1,c+1)=image(1:r,1);
% 
% newImage(1,1)=image(r,c);
% newImage(r+1,c+1)=image(1,1);
% 
% newImage(r+1,1)=image(1,c);
% newImage(1,c+1)=image(r,1);
% 
% 
% result= zeros(r+1,c+1);
% 
% row=r;
% col=c;
% 
% for i=2:row+1
%     for j=2:col+1
% %          1  1  1
% %          0  0  0
% %         -1 -1 -1
% %         
%         aa = newImage(i,j) * 0; 
%         bb = newImage(i+1,j)* (-1);
%         cc = newImage(i-1,j) *1;
%         ImageAnalyzer = newImage(i,j+1) *0 ;
%         ee = newImage(i,j-1) *0;
%         ff=newImage(i-1,j-1) *1;
%         gg=newImage(i-1,j+1) *1;
%         hh=newImage(i+1,j-1) * (-1);
%         ii=newImage(i+1,j+1) * (-1);
%         
%         val=aa+bb+cc+ImageAnalyzer+ee+ff+gg+hh+ii;
%         result(i,j)= result(i,j)+ val; 
%         
% %         -1  0  1        
% %         -1  0  1
% %         -1  0  1
% %         
% %         aa = newImage(i,j) * 0; 
% %         bb = newImage(i+1,j)*  0;
% %         cc = newImage(i-1,j) * 0;
% %         ImageAnalyzer = newImage(i,j+1) *1 ;
% %         ee = newImage(i,j-1) * (-1);
% %         ff=newImage(i-1,j-1) * (-1);
% %         gg=newImage(i-1,j+1) *1;
% %         hh=newImage(i+1,j-1) * (-1);
% %         ii=newImage(i+1,j+1) * 1;
% %         
% %         result(i,j)= result(i,j) +aa+bb+cc+ImageAnalyzer+ee+ff+gg+hh+ii;
%         
%         
%         
%         
% 
%     end
% end
% %result =uint8(result*255);
% 
% H = fspecial('prewitt');
% prewitted = imfilter(image,H);
% 
% figure ,imshow(prewitted);
% 
% 
% figure , imshow(result,[0 255]);
%

set(handles.text6,'String','Processing');
filter = [1 1 1 ;0 0 0 ;-1 -1 -1];

n = SpatialFilter(newImage,filter);

kernel = num2str(3);
kernell =[kernel ' X ' kernel];
set(handles.text7,'String',kernell);

axes(handles.axes3);
image(n);      


axes(handles.axes5);
hist(n);  
set(handles.text6,'String','Processing Completed');
display ('PREWITT FILTER END');

            
        case 5
            %% 'LoG'  Laplacian of Gaussian FILTER SECTION
   set(handles.text8,'Visible','on');         
% image = rgb2gray(imread('d:\img.jpg'));
% figure , imshow(image);
% [r c]=size(image);
% 
% newImage = zeros(r+2,c+2); % for zero padding 
% newImage(2:r+1,2:c+1)=image;
% 
% %for mirror padding 
% 
% newImage(1,2:c+1)=image(r,1:c);
% newImage(r+1,2:c+1)=image(1,1:c);
% 
% newImage(2:r+1,1)=image(1:r,c);
% newImage(2:r+1,c+1)=image(1:r,1);
% 
% newImage(1,1)=image(r,c);
% newImage(r+1,c+1)=image(1,1);
% 
% newImage(r+1,1)=image(1,c);
% newImage(1,c+1)=image(r,1);
% 
% 
% result= zeros(r+1,c+1);
% 
% row=r;
% col=c;
% 
% for i=3:row
%     for j=3:col

        
        
%          -45 Degree         
%         2  -1  -1       
%         -1  2  -1
%         -1  -1  2
%          
        
%  0  0  -1  0  0 
%  0 -1  -2 -1  0
% -1 -2  16 -2 -1
%  0 -1  -2 -1  0
%  0  0  -1  0  0 

%         aa = newImage(i,j) * (16); 
%         
%         bb = newImage(i+1,j)* (-2);
%         cc = newImage(i-1,j)* (-2);
%         ImageAnalyzer = newImage(i,j+1) * (-2) ;
%         ee = newImage(i,j-1) * (-2);
%         
%         ff=newImage(i-1,j-1) * (-1);
%         gg=newImage(i-1,j+1)* (-1);
%         hh=newImage(i+1,j-1)* (-1);
%         ii=newImage(i+1,j+1) * (-1);
%         
%         jj=newImage(i-2,j-2)* 0;
%         kk=newImage(i-1,j-2)* 0;
%         ll=newImage(i,j-2)* (-1);
%         mm=newImage(i+1,j-2)* (0);
%         nn=newImage(i+2,j-2)* (0);
%         
%         oo=newImage(i-2,j+2)* (0);
%         pp=newImage(i-1,j+2)* (0);
%         qq=newImage(i,j+2)* (-1);
%         rr=newImage(i+1,j+2)* (0);
%         ss=newImage(i+2,j+2)* (0);
%         
%         tt=newImage(i-2,j-1)* (0);
%         uu=newImage(i-2,j)* (-1);
%         vv=newImage(i-2,j+1)* (0);
%         
%         ww=newImage(i+2,j-1)* (0);
%         xx=newImage(i+2,j)* (-1);
%         yy=newImage(i+2,j+1)* (0);
%         
%         result(i,j)= result(i,j) +aa+bb+cc+ImageAnalyzer+ee+ff+gg+hh+ii+kk+ll+mm+nn+oo+pp+qq+rr+ss+tt+uu+vv+ww+xx+yy;        
%         
%         
% 
%     end
% end
%result =uint8(result*255);

%  H = fspecial('log');
%  prewitted = imfilter(image,H)*3;
%  
%  figure ,imshow(prewitted);
% 
% 
% figure , imshow(result,[0 255]);



%  0  0  -1  0  0 
%  0 -1  -2 -1  0
% -1 -2  16 -2 -1
%  0 -1  -2 -1  0
%  0  0  -1  0  0 

kernel = num2str(5);
kernell =[kernel ' X ' kernel];
set(handles.text7,'String',kernell);

set(handles.text6,'String','Processing');
filter = [0 0 -1 0 0 ;0 -1 -2 -1 0 ;-1 -2 16 -2 -1; 0 -1 -2 -1 0;0 0 -1 0 0];
n = SpatialFilter(newImage,filter);

axes(handles.axes3);
image(n);      


axes(handles.axes5);
hist(n);  
set(handles.text6,'String','Processing Completed');
display ('LoG');

        case 6
            %% 'Line Detection' FILTER SECTION
          
set(handles.text6,'String','Processing');
set(handles.text8,'Visible','on');   
display('LINE DETECTION INITIATED...');
display(uipanel3Value);

% for i=2:row+1
%     for j=2:col+1
%   Horizontal lines           
%         -1  -1  -1
%          2  2  2
%         -1 -1 -1
%    

kernel = num2str(3);
kernell =[kernel ' X ' kernel];
set(handles.text7,'String',kernell);

if strcmp(uipanel3Value,'Horizontal')
filter=[-1 -1 -1; 2 2 2;-1 -1 -1];
n = SpatialFilter(newImage,filter);

axes(handles.axes3);
image(n);      
        

axes(handles.axes5);
hist(n);  
set(handles.text6,'String','Processing Completed');
display(uipanel3Value);
end

%         aa = newImage(i,j) * 2; 
%         bb = newImage(i+1,j)* (-1);
%         cc = newImage(i-1,j) *(-1);
%         ImageAnalyzer = newImage(i,j+1) *2 ;
%         ee = newImage(i,j-1) *2;
%         ff=newImage(i-1,j-1) *(-1);
%         gg=newImage(i-1,j+1) *(-1);
%         hh=newImage(i+1,j-1) * (-1);
%         ii=newImage(i+1,j+1) * (-1);
%         
%         val=aa+bb+cc+ImageAnalyzer+ee+ff+gg+hh+ii;
%         result(i,j)= result(i,j)+ val; 
        

%           Vertical         
%         -1  2  -1        
%         -1  2  -1
% %         -1  2  -1
if strcmp(uipanel3Value,'Vertical')
filter=[-1 2 -1; -1 2 -1;-1 2 -1];
n = SpatialFilter(newImage,filter);

axes(handles.axes3);
image(n);      
        

axes(handles.axes5);
hist(n);  
set(handles.text6,'String','Processing Completed');
display(uipanel3Value);
end
% %         
%         aa = newImage(i,j) * 2; 
%         bb = newImage(i+1,j)*  2;
%         cc = newImage(i-1,j) * 2;
%         ImageAnalyzer = newImage(i,j+1) *(-1) ;
%         ee = newImage(i,j-1) * (-1);
%         ff=newImage(i-1,j-1) * (-1);
%         gg=newImage(i-1,j+1) *(-1);
%         hh=newImage(i+1,j-1) * (-1);
%         ii=newImage(i+1,j+1) * (-1);
%         
%         result(i,j)= result(i,j) +aa+bb+cc+ImageAnalyzer+ee+ff+gg+hh+ii;
        
       
%          45 Degree         
%         -1  -1  2       
%         -1  2  -1
%         2  -1  -1
%          
if strcmp(uipanel3Value,'radiobutton5')
filter=[-1 -1 2; -1 2 -1;2 -1 -1];
n = SpatialFilter(newImage,filter);

axes(handles.axes3);
image(n);      
        

axes(handles.axes5);
hist(n);  
set(handles.text6,'String','Processing Completed');
display(uipanel3Value);
end
%         aa = newImage(i,j) * 2; 
%         bb = newImage(i+1,j)*  (-1);
%         cc = newImage(i-1,j) * -1;
%         ImageAnalyzer = newImage(i,j+1) *(-1) ;
%         ee = newImage(i,j-1) * (-1);
%         ff=newImage(i-1,j-1) * (-1);
%         gg=newImage(i-1,j+1) *(2);
%         hh=newImage(i+1,j-1) * (2);
%         ii=newImage(i+1,j+1) * (-1);
%         
%         result(i,j)= result(i,j) +aa+bb+cc+ImageAnalyzer+ee+ff+gg+hh+ii;

%          -45 Degree         
%         2  -1  -1       
%         -1  2  -1
%         -1  -1  2
if strcmp(uipanel3Value,'radiobutton6')        
filter=[2 -1 -1; -1 2 -1;-1 -1 2];
n = SpatialFilter(newImage,filter);

axes(handles.axes3);
image(n);      


axes(handles.axes5);
hist(n);  
set(handles.text6,'String','Processing Completed');
display(uipanel3Value);
end

    

%          
%         aa = newImage(i,j) * 2; 
%         bb = newImage(i+1,j)*  (-1);
%         cc = newImage(i-1,j) * -1;
%         ImageAnalyzer = newImage(i,j+1) *(-1) ;
%         ee = newImage(i,j-1) * (-1);
%         ff=newImage(i-1,j-1) * (2);
%         gg=newImage(i-1,j+1) *(-1);
%         hh=newImage(i+1,j-1) * (-1);
%         ii=newImage(i+1,j+1) * (2);
%         
%         result(i,j)= result(i,j) +aa+bb+cc+ImageAnalyzer+ee+ff+gg+hh+ii;        
%         
%         
% 
%     end
% end
%result =uint8(result*255);

%  H = fspecial('log');
%  prewitted = imfilter(image,H);
%  
%  figure ,imshow(prewitted);
% 
% 
% figure , imshow(result,[0 255]);
            
        case 7
            %% DEVIATION
            set(handles.text8,'Visible','on');   
            set(handles.text6,'String','Processing');

            kernel = num2str(3);
kernell =[kernel ' X ' kernel];
set(handles.text7,'String',kernell);

% I=imread('d:\img.jpg');
%I=rgb2gray(img);
I=im2double(img);
[r s]= size(I);
for i=2:r-1;
for j=2:s-1;
   
x= (I(i,j)+I(i+1,j)+I(i-1,j)+I(i,j+1)+I(i,j-1)+I(i-1,j-1)+I(i-1,j+1)+I(i+1,j-1)+I(i+1,j+1))/9; %Mean
s1=(I(i,j)-x)*(I(i,j)-x);
s2=(I(i+1,j)-x)*(I(i+1,j)-x);
s3=(I(i-1,j)-x)*(I(i-1,j)-x);
s4=(I(i,j+1)-x)*(I(i,j+1)-x);
s5=(I(i,j-1)-x)*(I(i,j-1)-x);
s6=(I(i-1,j-1)-x)*(I(i-1,j-1)-x);
s7=(I(i-1,j+1)-x)*(I(i-1,j+1)-x);
s8=(I(i+1,j-1)-x)*(I(i+1,j-1)-x);
s9=(I(i+1,j+1)-x)*(I(i+1,j+1)-x);
S=s1+s2+s3+s4+s5+s6+s7+s8+s9;
v=S/9; % Varience
std=sqrt(v); % Standard Diviation
I(i,j)=std;
end
end
% disp(sqrt(28));
% imshow(I);
% figure;imhist(I);


axes(handles.axes3);
image(uint8(I*255));      


axes(handles.axes5);
hist(I);  
set(handles.text6,'String','Processing Completed');

        case 8
            %% VARIANCE
            set(handles.text6,'String','Processing');
            set(handles.text8,'Visible','on');   
         kernel = num2str(3);
kernell =[kernel ' X ' kernel];
set(handles.text7,'String',kernell);
   
% I=imread('d:\img.jpg');
%I=rgb2gray(img);
I=im2double(img);
[r s]= size(I);
for i=2:r-1;
for j=2:s-1;
   
x= (I(i,j)+I(i+1,j)+I(i-1,j)+I(i,j+1)+I(i,j-1)+I(i-1,j-1)+I(i-1,j+1)+I(i+1,j-1)+I(i+1,j+1))/9; %Mean
s1=(I(i,j)-x)*(I(i,j)-x);
s2=(I(i+1,j)-x)*(I(i+1,j)-x);
s3=(I(i-1,j)-x)*(I(i-1,j)-x);
s4=(I(i,j+1)-x)*(I(i,j+1)-x);
s5=(I(i,j-1)-x)*(I(i,j-1)-x);
s6=(I(i-1,j-1)-x)*(I(i-1,j-1)-x);
s7=(I(i-1,j+1)-x)*(I(i-1,j+1)-x);
s8=(I(i+1,j-1)-x)*(I(i+1,j-1)-x);
s9=(I(i+1,j+1)-x)*(I(i+1,j+1)-x);
S=s1+s2+s3+s4+s5+s6+s7+s8+s9;
v=S/9; % Varience
%std=sqrt(v); % Standard Diviation
I(i,j)=v;
end
end
% disp(sqrt(28));
% imshow(I);
% figure;imhist(I);


axes(handles.axes3);
image(uint8(I*255));      


axes(handles.axes5);
hist(I);  
            
set(handles.text6,'String','Processing Completed');            
        case 9
            %% Entropy 

set(handles.text6,'String','Processing');            
imm=entropyfilt(img); 
                       
axes(handles.axes3);
imshow(imm ,[]);      


axes(handles.axes5);
hist(imm);  
set(handles.text6,'String','Processing Completed');            
            
    
    case 10
%% Histogram Equalization    
    
    set(handles.text6,'String','Processing');            
imm=histeq(img);
    
axes(handles.axes3);
imshow(imm);      


axes(handles.axes5);
imhist(imm);  
set(handles.text6,'String','Processing Completed');     
    
    end
    
end

if strcmp(uipanel2Value,'frequency')
    switch (val)
        case 1
       %% Ideal Low Pass 

set(handles.text6,'String','Processing');

set(handles.text8,'Visible','on');
set(handles.text8,'String','Threshold');
set(handles.text7,'String',sliderValueF);

FI=fft2(img);
SFI=fftshift(FI);
%figure , imshow(log(1+ abs(SFI)),[]);
[r c] =size(SFI);
h=zeros(r,c);

freq = sliderValueF;
d0 =freq * r * c;

for k=1:r
    for l=1:c
        i1=(r/2)-k;
        j1=(c/2)-l;
        d=i1*i1 + j1*j1;
        if(d<d0)
            h(k,l)=1;
        end
    end
end

%figure,imshow(h,[]);

ASFI =h.*SFI;
%figure ,imshow(log (1+abs(ASFI)),[]);

IASFI = ifft2(ASFI);
axes(handles.axes3);
imshow(abs(IASFI),[]);


axes(handles.axes5);
hist(abs(IASFI));  
set(handles.text6,'String','Processing Completed');
%figure ,imshow(abs(IASFI),[]);
            
            
        case 2
        %% Ideal High Pass
set(handles.text6,'String','Processing');

set(handles.text8,'Visible','on');
set(handles.text8,'String','Threshold');
set(handles.text7,'String',sliderValueF);

FI=fft2(img);
SFI=fftshift(FI);
%figure , imshow(log(1+ abs(SFI)),[]);
[r c] =size(SFI);
h=zeros(r,c);

freq = sliderValueF;
d0 =freq * r * c;

for k=1:r
    for l=1:c
        i1=(r/2)-k;
        j1=(c/2)-l;
        d=i1*i1 + j1*j1;
        if(d>d0)
            h(k,l)=1;
        end
    end
end

%figure,imshow(h,[]);

ASFI =h.*SFI;
%figure ,imshow(log (1+abs(ASFI)),[]);

IASFI = ifft2(ASFI);
axes(handles.axes3);
imshow(abs(IASFI),[]);     
%figure ,imshow(abs(IASFI),[]);
                        
axes(handles.axes5);
hist(abs(IASFI));            
set(handles.text6,'String','Processing Completed');
            
        case 3
        %% Butterworth low
set(handles.text6,'String','Processing');

set(handles.text8,'Visible','on');
set(handles.text8,'String','Threshold');
set(handles.text7,'String',sliderValueF);

%figure  , imshow(image);
%image = imnoise(image,'salt & pepper',0.02);
%figure , imshow(image);
FI=fft2(img);
SFI=fftshift(FI);
%figure , imshow(log(1+ abs(SFI)),[]);
[r c] =size(SFI);
h=ones(r,c);

freq = sliderValueF;
d0 =freq * r * c;
row=r;
col=c;
for k=1:row
    for l=1:col
        i1=(r/2)-k;
        j1=(c/2)-l;
        d=i1*i1 + j1*j1;
        
            h(k,l)=1/(1+(d/d0)^2);
        
    end
end

%figure,imshow(h,[]);

ASFI =h.*SFI;
%figure ,imshow(log (1+abs(ASFI)),[]);

IASFI = ifft2(ASFI);
%figure ,imshow(abs(IASFI),[]);
            
            

axes(handles.axes3);
imshow(abs(IASFI),[]);     
%figure ,imshow(abs(IASFI),[]);
 axes(handles.axes5);
hist(abs(IASFI));                         
set(handles.text6,'String','Processing Completed');
    
        case 4
            %% Butterworth High

set(handles.text8,'Visible','on');
set(handles.text8,'String','Threshold');
set(handles.text7,'String',sliderValueF);

            %figure  , imshow(image);
%image = imnoise(image,'salt & pepper',0.02);
%figure , imshow(image);
set(handles.text6,'String','Processing');
FI=fft2(img);
SFI=fftshift(FI);
%figure , imshow(log(1+ abs(SFI)),[]);
[r c] =size(SFI);
h=ones(r,c);

freq = sliderValueF;
d0 =freq * r * c;
row=r;
col=c;
for k=1:row
    for l=1:col
        i1=(r/2)-k;
        j1=(c/2)-l;
        d=i1*i1 + j1*j1;
        
            %h(k,l)=1/(1+(d/d0)^2); for Low 
            h(k,l)=1/(1+(d0/d)^2);
        
    end
end

%figure,imshow(h,[]);

ASFI =h.*SFI;
%figure ,imshow(log (1+abs(ASFI)),[]);

IASFI = ifft2(ASFI);
%figure ,imshow(abs(IASFI),[]);
            
            

axes(handles.axes3);
imshow(abs(IASFI),[]);     
%figure ,imshow(abs(IASFI),[]);    

axes(handles.axes5);
hist(abs(IASFI));
set(handles.text6,'String','Processing Completed');
    
    end
    
            
            
end


end


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


