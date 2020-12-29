% Create a new mydate object  

classdef measurements

% PROPERTIES SECTION
    properties
       values; 
    end
      
   properties(GetAccess=private,SetAccess=private)
       mean; 
   end
   
% METHODS SECTION
   methods
       
      % Object constructor
      function obj = measurements(measurements)
        if (nargin>0)
            obj.values  = measurements;
        end
      end

  %Subtract the mean from the object values
       function obj = SubtractMean(obj)
           obj.mean=mean(obj.values, 'all');
           obj.values = obj.values-obj.mean;
           disp(obj.mean)
       end
       
      %Conversion of object values to Celsius
      % must apply formula on obj.values
      function obj = Celsius(obj) 
          obj.values=(5/9)*(obj.values-32);
      end 
   
       
       end
   end