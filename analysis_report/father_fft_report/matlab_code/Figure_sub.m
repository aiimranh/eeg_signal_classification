% Suppress the warning about modified column headers
warning('off', 'MATLAB:table:ModifiedAndSavedVarnames');

% Specify the directory path
directoryPath = 'K:\Father Fourier Analysis Report\';

for i = 1:20
    % Use the dir function to get information about files
    if i>=10
        pattern = strcat('s',num2str(i));
    else
        pattern = strcat('s0',num2str(i));
    end
    filesInfo = dir(fullfile(directoryPath, ['Frequency_' pattern '*.xlsx']));

    figure(i);
    % Display the list of files
    for j = 1:numel(filesInfo)
        dataTable = readtable(fullfile(directoryPath,filesInfo(j).name));
        dataTableX = dataTable.DominantFrequency;
        x_axis = 1:length(dataTableX);
        plot(x_axis,dataTableX,'LineWidth', 2);
        hold on
    end
    hold off
    xlabel('Subject');
    ylabel('Frequency (Hz)');
    legend('Central', 'Frontal', 'Periferal', 'Temporal');
end