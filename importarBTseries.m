%path = '/Users/reyes/Google Drive/0_CurrentProjects/16-03-22 Transport measurements/'
clear all
logfilename = 'S1.txt';
[pathstr,logfname,logext] = fileparts(logfilename); 
savingname ='er';
log=importlog(logfilename);

for i=1:length(log.Temp)
filename=strcat(logfname,log.name{i},'.dat')


delimiter = '\t';

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
B{i} = dataArray{:, 1};
R{i}= dataArray{:, 2};
%VarName3 = dataArray{:, 3};
%VarName4 = dataArray{:, 4};
plot(B{i},R{i})
hold on
end

save(savingname,'B','R','log')

plotpretty('Bfield (B)','Resistance (ohms)')
saveas(gcf,savingname,'png')
%% Clear temporary variables
clear all;