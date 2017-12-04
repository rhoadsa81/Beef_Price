function [Date,Steerlow250,Steerhigh250] = importfile(workbookFile,sheetName,startRow,endRow)
%IMPORTFILE Import data from a spreadsheet
%   [VarName1,VarName3,VarName4] = IMPORTFILE(FILE) reads data from the
%   first worksheet in the Microsoft Excel spreadsheet file named FILE and
%   returns the data as column vectors.
%
%   [VarName1,VarName3,VarName4] = IMPORTFILE(FILE,SHEET) reads from the
%   specified worksheet.
%
%   [VarName1,VarName3,VarName4] = IMPORTFILE(FILE,SHEET,STARTROW,ENDROW)
%   reads from the specified worksheet for the specified row interval(s).
%   Specify STARTROW and ENDROW as a pair of scalars or vectors of matching
%   size for dis-contiguous row intervals. To read to the end of the file
%   specify an ENDROW of inf.%
% Example:
%   [VarName1,VarName3,VarName4] = importfile('Beef_price.xlsx','Sheet1',[3,10,17,24,31,38,45,52,59,66,73,81,88,95,102,109,116,123,130,138,145,152,159,166,173],[3,10,17,24,31,38,45,52,59,66,73,81,88,95,102,109,116,123,130,138,145,152,159,166,173]);
%
%   See also XLSREAD.

% Auto-generated by MATLAB on 2017/12/03 17:25:32

%% Input handling

% If no sheet is specified, read first sheet
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% If row start and end points are not specified, define defaults
if nargin <= 3
    startRow = [3,10,17,24,31,38,45,52,59,66,73,81,88,95,102,109,116,123,130,138,145,152,159,166,173];
    endRow = [3,10,17,24,31,38,45,52,59,66,73,81,88,95,102,109,116,123,130,138,145,152,159,166,173];
end

%% Import the data, extracting spreadsheet dates in Excel serial date format
[~, ~, raw1, dates1] = xlsread(workbookFile, sheetName, sprintf('A%d:A%d',startRow(1),endRow(1)),'' , @convertSpreadsheetExcelDates);
[~, ~, raw2, dates2] = xlsread(workbookFile, sheetName, sprintf('C%d:D%d',startRow(1),endRow(1)),'' , @convertSpreadsheetExcelDates);
raw = [raw1,raw2];
dates = [dates1,dates2];
for block=2:length(startRow)
    [~, ~, tmpRawBlock1, tmpDateNumBlock1] = xlsread(workbookFile, sheetName, sprintf('A%d:A%d',startRow(block),endRow(block)),'' , @convertSpreadsheetExcelDates);
    [~, ~, tmpRawBlock2, tmpDateNumBlock2] = xlsread(workbookFile, sheetName, sprintf('C%d:D%d',startRow(block),endRow(block)),'' , @convertSpreadsheetExcelDates);
    raw = [raw;tmpRawBlock1,tmpRawBlock2]; %#ok<AGROW>
    dates = [dates;tmpDateNumBlock1,tmpDateNumBlock2]; %#ok<AGROW>
end
raw = raw(:,[2,3]);
dates = dates(:,1);

%% Create output variable
I = cellfun(@(x) ischar(x), raw);
raw(I) = {NaN};
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
dates(~cellfun(@(x) isnumeric(x) || islogical(x), dates)) = {NaN};
Date = datetime([dates{:,1}].', 'ConvertFrom', 'Excel', 'Format', 'MM/dd/yyyy');
Steerlow250 = data(:,1);
Steerhigh250 = data(:,2);


