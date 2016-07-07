%path = '/Users/reyes/Google Drive/0_CurrentProjects/16-03-22 Transport measurements/'
filename = 'S1TEST.txt_4P_270K-10K_90_0.1uA.dat';
savingname ='en';
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
T = dataArray{:, 1};
R = dataArray{:, 2};
%VarName3 = dataArray{:, 3};
%VarName4 = dataArray{:, 4};
save(savingname,'T','R')
scatter(T,R,'filled')
plotpretty('Temperature (T)','Resistance (ohms)')
saveas(gcf,savingname,'png')
%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans savingname;