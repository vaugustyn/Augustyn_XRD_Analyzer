%% In-situ XRD Data Heatmap Generator 
% Authors: Sophia Shi    
% Instructions:
%   1. User should move all XRD text files into the same folder (only containing the files to be analyzed).
%   2. Download the code and save it into the folder that contains the relevant data.
%   3. Make sure file name formula in line 14 matches the file names of the XRD txt files.
%   4. Make sure file names are numbered starting from 0.
%   5. Adjust the surface plot properties if desitred, includin the dimensions.
%   6. Run the code. A plot will appear. Save the plot.

% Create 3 matrixes.
two_theta = []
time = []
intensity = []

for n=0:19 %for loop to read files
    textFileName = ['1st hour_' num2str(n) '.asc'] %assign current file name as a string variable
    fileID = fopen(textFileName,'r') %open current file and reads content. Store content into a new variable "fileID"
    C = textscan(fileID,'%f %f %f','Delimiter',' ') %Store each column into matrix C.
    fclose(fileID) %close current file
    two_theta = [two_theta C{1}] %Copy the 2-theta values (1st column) into a new matrix
    intensity = [intensity C{2}] %Copy the intensity values (2nd column) into a new matrix
    time = [time repmat(n*3,691,1)]
end %end the for loop


s = surf(two_theta, time, intensity) %Create surface plot and assign it to the variable S
s.EdgeColor = 'none' %define surface edge color and/or other properties
xlabel('2 Theta (degrees)')
ylabel('Time (min)')
zlabel('Intensity (absolute)')
view([0,90]); %Adjust the view angle
axis([min(two_theta(:)) max(two_theta(:)) min(time(:)) max(time(:))]); %Define the desired heatmap dimensions
bar = colorbar %Insert a colorbar and assign it to a variable "bar".
bar.Label.String = "Intensity" %Define the colorbar variable
bar.Label.FontSize = 12 
colormap jet %Assign the color scheme. 