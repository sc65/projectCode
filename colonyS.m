
classdef colonyS
    %% stores colony path, radius and radialprofile (in microns) for each colony
    
    properties
        id
        fileFolder
        fileName
        nTimepoints
        radius % microns
    end
    
    properties(SetAccess = private)
        radialProfile
    end
    
    methods
        % contstructor function
        function object = colonyS(id, fileFolder, fileName, nTimepoints, radius)
            if nargin > 0
                object.id = id;
                object.fileFolder = fileFolder;
                object.fileName = fileName;
                object.nTimepoints = nTimepoints;
                object.radius = radius;
            end
        end
        
        function saveMasks(object) % read metadata from metadata file.
            filePrefix = strtok(object.fileName, '.');
            maskName = [filePrefix '_Simple Segmentation.h5'];
            mask = readIlastikFile([object.fileFolder filesep maskName]);
            % -----------------------------------------------------------
            %compute and save nuclei and colony masks for future references
            nucleiMask = bwareaopen(mask, 10);
            %------ add a separate method to calculate colonyMask from nuclear mask. 
            %------ save nuclear and colony mask. 
            
            %------------------------------------------------------------  
        end
        
%         function calculateRadialProfile(object)
%             
%         end
    end
    
end
