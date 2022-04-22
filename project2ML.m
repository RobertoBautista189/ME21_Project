clear all
clc
 
f = figure;
myaxes=axes(f);
myaxes.Units='pixels';
myaxes.Position=[50 120 480 280];
chooseplot = uicontrol(f, 'Style', 'text', 'String', 'Select Date', 'Position',[120 50 120 20]);
constant_title = uicontrol(f, 'Style', 'text' , 'String', 'Enter Name', 'Position', [300 50 120 20]);%This is the string that will be above the constant the user will input
constant_value = uicontrol(f, 'Style', 'edit', 'Position',[300 30 120 20]);
plotchoices = char('Occurences', 'Popularity');
plotoptions = uicontrol(f, 'Style', 'popup', 'String', plotchoices, 'Position', [120 30 120 20]);
buttonplot = uicontrol(f, 'Style', 'pushbutton', 'Position', [40 30 50 40], 'String', 'Plot now!', 'fontsize', 8, 'callback', {@plotbuttonpush, plotoptions, constant_value});
   



function plotbuttonpush(~, ~, plotoptions,constant_value) 
    what2plot = get(plotoptions, 'value');
    constant = get(constant_value, 'string');
if what2plot == 1
    
    fid = fopen('years.txt','r');
    headerline = fgetl(fid);
    frewind(fid);
    filedata = textscan(fid,'%s','Delimiter','\t','Headerlines',1);
    year = filedata{1,1};
    yearR = pad(year,4,'left','0');
    yearK = strrep(yearR,'''','');
    yearC = cell2mat(yearK);
    yearL = yearC;
    yearN = str2num(yearL);


    fid2 = fopen('instances.txt','r');
    headerline = fgetl(fid2);
    frewind(fid2);
    filedata2 = textscan(fid2,'%s','Delimiter','\t','Headerlines',1);

    instances=filedata2{1,1}
    instancesR= pad(instances,10,'left','0');
    instancesK = strrep(instancesR,'''','');
    instancesC = cell2mat(instancesK);
    instancesL = instancesC;
    instancesN = str2num(instancesL);
    
    fid4 = fopen('m1b1m2b2.txt','r');
    headerline = fgetl(fid4);
    frewind(fid4);
    filedata4 = textscan(fid4,'%s','Delimiter','\t','Headerlines',1);

    m1=filedata4{1,1}{1,1}
    m1R= pad(m1,6,'left','0');
    m1K = strrep(m1R,'''','');
    m1L = m1K(1:1,1:10);
    m1N = str2num(m1L);

    b1=filedata4{1,1}{2,1}
    b1R= pad(b1,10,'left','0');
    b1K = strrep(b1R,'''','');
    b1L = b1K(1:1,1:10);
    b1N = str2num(b1L);
    x=yearN
    y=instancesN
    plot( x, y, 'or','linewidth', 2, 'markersize',5)
    hold on;
    x=yearN
    y=(m1N*x)+b1N
    plot(x, y, '-b','linewidth', 2, 'markersize',5)
    xlabel('Year');
    ylabel('Occurances');
    mlegend = ['m = ',num2str(round(m1N,2)),', b = ',num2str(round(b1N,2))];
    leg = legend('SSN Data',mlegend);
    leg.FontSize = 7;
    hold off
    

elseif what2plot == 2
    fid = fopen('years.txt','r');
    headerline = fgetl(fid);
    frewind(fid);
    filedata = textscan(fid,'%s','Delimiter','\t','Headerlines',1);

    year = filedata{1,1};
    yearR = pad(year,4,'left','0');
    yearK = strrep(yearR,'''','');
    yearC = cell2mat(yearK);
    yearL = yearC;
    yearN = str2num(yearL);
    
    fid3 = fopen('popularity.txt','r');headerline = fgetl(fid3);
    frewind(fid3);
    filedata3 = textscan(fid3,'%s','Delimiter','\t','Headerlines',1);

    popularity=filedata3{1,1}
    popularityR= pad(popularity,20,'left','0');
    popularityK = strrep(popularityR,'''','');
    popularityC = cell2mat(popularityK);
    popularityL = popularityC;
    popularityN = str2num(popularityL);
    
    fid4 = fopen('m1b1m2b2.txt','r');
    headerline = fgetl(fid4);
    frewind(fid4);
    filedata4 = textscan(fid4,'%s','Delimiter','\t','Headerlines',1);
    m2=filedata4{1,1}{3,1}
    m2R= pad(m2,10,'right','0');
    m2K = strrep(m2R,'''','');
    m2L = m2K(1:1,1:10);
    m2N = str2num(m2L);

    b2=filedata4{1,1}{4,1}
    b2R= pad(b2,10,'left','0');
    b2K = strrep(b2R,'''','');
    b2L = b2K(1:1,1:10);
    b2N = str2num(b2L);

    x=yearN
    y=popularityN
    plot( x, y, 'or','linewidth', 2, 'markersize',5)
    hold on;
    x=yearN
    y=(m2N*x)+b2N
    plot(x, y, '-b','linewidth', 2, 'markersize',5)
    hold off
    title(constant)
    xlabel('Year');
    ylabel('Popularity');
    mlegend = ['m = ',num2str(round(m2N,2)),', b = ',num2str(round(b2N,2))];
    leg = legend('SSN Data',mlegend);
    leg.FontSize = 7;
    hold off
end
end

