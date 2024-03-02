% Suppress the warning about modified column headers
warning('off', 'MATLAB:table:ModifiedAndSavedVarnames');

% Specify the directory path
    directoryPath = 'K:\Father Fourier Analysis Report\';
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
        if pattern == "ex01" || pattern == "ex02"
            for l = 1:3
                subplot(1,3,l);
                for j = 1:numel(filesInfo)
                    % disp(filesInfo(j).name);
                    dataTable = readtable(fullfile(directoryPath,filesInfo(j).name));
                    dataTableX = dataTable(dataTable.SessionName == l, :);
                    dataTableY = dataTableX.DominantFrequency;
                    x_axis = 1:length(dataTableY);
                    plot(x_axis,dataTableY,'LineWidth', 2);
                    hold on
                 end
                 finalattribute = strcat(' session ',num2str(l));
                 xlabel('Subject');
                 ylabel('Frequency (Hz)');
                 title(finalattribute);
                 legend('Central', 'Frontal', 'Periferal', 'Temporal');
                 hold off
                 writematrix(strcat('output.csv', your_data));
            end
        else
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
    end