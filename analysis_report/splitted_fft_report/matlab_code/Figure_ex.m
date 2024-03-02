% Suppress the warning about modified column headers
warning('off', 'MATLAB:table:ModifiedAndSavedVarnames');

% Specify the directory path
directoryPath = 'K:\Mother Fourier Analysis Report\';

for i = 1:10
    % Use the dir function to get information about files
    if i == 3 || i == 4
        continue
    else
        if i==10
            pattern = 'ex10';
        else
            pattern = strcat('ex0',num2str(i));
        end
    end
    filesInfo = dir(fullfile(directoryPath, ['Frequency_' pattern '*.xlsx']));

    figure(i);
    % Display the list of files
    n = 1;
    for j = 1:numel(filesInfo)
        dataTable = readtable(fullfile(directoryPath,filesInfo(j).name));
        s = length(filesInfo(j).name);
        x = filesInfo(j).name;
        attributeType = x(16:s-5);
        if dataTable.SessionName == 0
            subplot(2,2,j);
            for k = 1:20
                dataTableX = dataTable(k, {'Seg0', 'Seg1', 'Seg2', 'Seg3', 'Seg4', 'Seg5', 'Seg6', 'Seg7', 'Seg8', 'Seg9'});
                dataTableY = table2array(dataTableX);
                plot(1:10,dataTableY,'LineWidth', 2);
                hold on
            end
            xlabel('Segment');
            ylabel('Frequency (Hz)');
            title(attributeType);
            hold off  
        else
            
            for l = 1:3
                subplot(4,3,n);
                for k = 1:20
                    dataTableX = dataTable(dataTable.SessionName == l, {'Seg0', 'Seg1', 'Seg2', 'Seg3', 'Seg4', 'Seg5', 'Seg6', 'Seg7', 'Seg8', 'Seg9'});
                    dataTableY = table2array(dataTableX);
                    plot(1:10,dataTableY,'LineWidth', 2);
                    hold on
                end
                xlabel('Segment');
                ylabel('Frequency (Hz)');
                title(attributeType);
                hold off
                n = n + 1;
            end
        end
    end
end