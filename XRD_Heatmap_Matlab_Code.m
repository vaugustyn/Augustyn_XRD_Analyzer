% Create 3 matrixes.
    two_theta = []
    time = []
    intensity = []

% Create a for loop to read the files in order.
%   -In each repetition, assign the currrent file name as the string
%     variable "textFilename".
%   -Open the current file with "fopen" function and store its content in
%     a new variable "fileID". 'r' is to read the file.
%   -Assign all the columns to a cell "C". Be sure to include the data type
%     for every coloumn. For example 3 coloumns could be '%f,%f,%f'.
%     'Delimeter' is the character(s) that separate the coloumns. Here would
%     be a space. Sometimes, the delimiter could be a comma.
%   -Remember to close the file so that you don't loose its content.
%   -Interpolate each coloumn to the XYZ matrixes with a space in between.
%     If using a comma in between, the data will be added to the end of one
%     column. You don't have to assign all columns if you don't need all of them.
%   -Create data for the other matrixes that can't be obatined from data files. 
%     Make sure all matrixes have the same size.
%   -End the for loop.
    for n=0:19
        textFileName = ['1st hour_' num2str(n) '.asc']
        fileID = fopen(textFileName,'r')
        C = textscan(fileID,'%f %f %f','Delimiter',' ')
        fclose(fileID)
        two_theta = [two_theta C{1}]
        intensity = [intensity C{2}]
        time = [time repmat(n*3,691,1)]
    end

 %Use the "surf" function to plot X, Y, Z into a 3D surface plot. Assign
 %this plot to a new variable "s" so we can style the surface plot using
 %"s.Property..."
    s = surf(two_theta, time, intensity)
    s.EdgeColor = 'none'
 %Label the axises.
    xlabel('2 Theta (degrees)')
    ylabel('Time (min)')
    zlabel('Intensity (absolute)')
 %Adjust the view angle to top view. A view at a different angle 
 %(e.g.[60,30]) will result in a 3D surface lot.
    view([0,90]);
 %Use this code so that the heatmap will fit perfectly to the desired
 %dimension range. Otherwise there will be a white strip on the edges.
    axis([min(two_theta(:)) max(two_theta(:)) min(time(:)) max(time(:))]);
 %Insert a colorbar and assign it to a variable "b". Add title and style
 %the colorbar if desired.
    bar = colorbar
    bar.Label.String = "Intensity"
    bar.Label.FontSize = 12
 %Assign the color scheme. 
    colormap jet