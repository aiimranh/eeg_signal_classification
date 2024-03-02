% Specify the directory path
directoryPath = 'K:\Mother Fourier Analysis Report\';

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
        s = length(filesInfo(j).name);
        x = filesInfo(j).name;
        attributeType = x(15:s-5);
        subplot(2,2,j);
        for k = 1:12
            dataTableX = dataTable(k, {'Seg0', 'Seg1', 'Seg2', 'Seg3', 'Seg4', 'Seg5', 'Seg6', 'Seg7', 'Seg8', 'Seg9'});
            dataTableY = table2array(dataTableX);
            plot(1:10,dataTableY,'LineWidth', 2);
            hold on
         end
         xlabel('Segment');
         ylabel('Frequency (Hz)');
         title(attributeType);
         hold off  
     end
end