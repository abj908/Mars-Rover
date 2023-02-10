%creates function with 3 ouputs and 4 inputs
function [direction, takeSample, takePhoto] = abj37Rover(waterData, elevationData, cWater, cElevation)

%Highest Priority 

%if waterData(1) is greater than all other values in the waterData, and it
%is >700, and > cWater then execute if statements
if (waterData(1)>waterData(2) && waterData(1)>waterData(3) && waterData(1)> 700 && (waterData(1)> cWater))
    direction = 'L';
    takeSample=0;
    takePhoto = 0;
%(run if above statments are false) if waterData(2) is greater than all other values in the waterData, and it
%is >700, and > cWater then execute if statements
elseif (waterData(2)>waterData(1) && waterData(2)>waterData(3) && waterData(2)>700 && (waterData(2)> cWater))
    direction = 'F';
    takeSample=0;
    takePhoto = 0;
%(run if above statments are false) if waterData(3) is greater than all other values in the waterData, and it
%is >700, and > cWater then execute if statements
elseif(waterData(3)>waterData(1) && waterData(3)>waterData(2) && waterData(3)>700 && (waterData(3)> cWater))
    direction = 'R';
    takeSample=0;
    takePhoto=0;
%(run if above statments are false) if cWater is greater than all elemenents in waterData and is >1000
elseif cWater> waterData(1) && cWater> waterData(2) && cWater> waterData(3) && cWater>1000
    takeSample=1;
    direction = 'F';
    takePhoto = 0;
    
%Second Priority 

else
    %if all above statments are false. then run statements below 
    takeSample=0;
    %if elevationData(1) is greater than all other values in the elevationData, and > cElevation then execute if statement
    if((elevationData(1)>elevationData(2)) && (elevationData(1)>elevationData(3)) && (elevationData(1) > cElevation))
        direction = 'L';
        takePhoto =0;
     %(run if above statments are false) if elevationData(2) is greater than all other values in the elevationData, and > cElevation then execute if statement   
     elseif((elevationData(2)>elevationData(1)) && (elevationData(2)>elevationData(3)) && (elevationData(2) > cElevation))
        direction = 'F';
        takePhoto =0;
     %(run if above statments are false) if elevationData(3) is greater than all other values in the elevationData, and > cElevation then execute if statement
     elseif((elevationData(3)>elevationData(1)) && (elevationData(3)>elevationData(2)) && (elevationData(3) > cElevation))
        direction = 'R';
        takePhoto =0;
    %(run if above statments are false) if cElevation is > all elements in elevationData 
     elseif (cElevation> elevationData(1)) && (cElevation> elevationData(2)) && (cElevation> elevationData(3))
        takePhoto=1;
        direction = 'F';
    end 
        
end 

end





 
