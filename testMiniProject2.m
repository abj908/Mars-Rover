function testMiniProject2(netid)

load planet1

figure('Position',[0 0, 1280,720])
subplot(2,2,1)

p0 = surf(elev,'LineStyle','none');
hold all
title('Planet 1, Reference Solution')
for i = 1:50
    for j = 1:50
        if vapor(i,j) > 1000
            p1 = scatter3(j,i,elev(i,j),'MarkerEdgeColor','b',...
                'MarkerFaceColor','b');
        end
    end
end

load planet1reference
for i = 1:soilCt
    p2 = scatter3(soilTrack(i,2),soilTrack(i,1),elev(soilTrack(i,1),soilTrack(i,2)),...
        'MarkerEdgeColor','g','MarkerFaceColor','g');
end
if soilCt == 0
    p2 = scatter3(0,0,0,...
       'MarkerEdgeColor','none','MarkerFaceColor','none');
end
for i = 1:photoCt
    p3 = scatter3(photoTrack(i,2),photoTrack(i,1),elev(photoTrack(i,1),photoTrack(i,2)),...
       'MarkerEdgeColor','w','MarkerFaceColor','w');
end
if photoCt == 0
    p3 = scatter3(0,0,0,...
       'MarkerEdgeColor','none','MarkerFaceColor','none');
end
for i = 1:99
    p4 = plot3(pth(i:i+1,2),pth(i:i+1,1),[elev(pth(i,1),pth(i,2)) elev(pth(i+1,1),pth(i+1,2))],...
        'm','LineWidth',5);
end

legend([p0, p1, p2, p3, p4],'elev','Water Locations','Soil Samples','Photos','Robot pth','Location','eastoutside')


subplot(2,2,2)
p0 = surf(elev,'LineStyle','none');
hold all
for i = 1:50
    for j = 1:50
        if vapor(i,j) > 1000
            p1 = scatter3(j,i,elev(i,j),'MarkerEdgeColor','b',...
                'MarkerFaceColor','b');
        end
    end
end

pos = [25 25];
%0 = north, 2 = south, 1 = east, 3 = west
dir = 0;
soilCt = 0;
photoCt = 0;
for i = 1:100
    pth(i,:) = pos;
    el = elev(pos(1),pos(2));
    wa = vapor(pos(1),pos(2));
    if dir == 0
        waterData = [vapor(pos(1),pos(2)-1) vapor(pos(1)+1,pos(2)) vapor(pos(1),pos(2)+1)];
        elevData = [elev(pos(1),pos(2)-1) elev(pos(1)+1,pos(2)) elev(pos(1),pos(2)+1)];
    elseif dir == 1
        waterData = [vapor(pos(1)-1,pos(2)) vapor(pos(1),pos(2)+1) vapor(pos(1)+1,pos(2))];
        elevData = [elev(pos(1)-1,pos(2)) elev(pos(1),pos(2)+1) elev(pos(1)+1,pos(2))];
    elseif dir ==2
        waterData = [vapor(pos(1),pos(2)+1) vapor(pos(1)-1,pos(2)) vapor(pos(1),pos(2)-1)];
        elevData = [elev(pos(1),pos(2)+1) elev(pos(1)-1,pos(2)) elev(pos(1),pos(2)-1)];
    else
         waterData = [vapor(pos(1)+1,pos(2)) vapor(pos(1),pos(2)-1) vapor(pos(1)-1,pos(2))];
        elevData = [elev(pos(1)+1,pos(2)) elev(pos(1),pos(2)-1) elev(pos(1)-1,pos(2))];
    end
    [newD,soil,photo] = feval([netid 'Rover'],waterData,elevData,wa,el);
    switch newD
        case 'L'
            dir = mod(dir-1,4);
        case 'R'
            dir = mod(dir+1,4);
    end
    if soil
        soilCt = soilCt + 1;
        soilTrack(soilCt,:) = pos;
    end
    if photo
        photoCt = photoCt + 1;
        photoTrack(photoCt,:) = pos;
    end
    if dir == 0
        pos(1) = pos(1)+1;
    elseif dir == 1
        pos(2) = pos(2)+1;
    elseif dir == 2
        pos(1) = pos(1)-1;
    else
        pos(2) = pos(2)-1;
    end
end

for i = 1:soilCt
    p2 = scatter3(soilTrack(i,2),soilTrack(i,1),elev(soilTrack(i,1),soilTrack(i,2)),...
        'MarkerEdgeColor','g','MarkerFaceColor','g');
end
if soilCt == 0
    p2 = scatter3(0,0,0,...
       'MarkerEdgeColor','none','MarkerFaceColor','none');
end
for i = 1:photoCt
    p3 = scatter3(photoTrack(i,2),photoTrack(i,1),elev(photoTrack(i,1),photoTrack(i,2)),...
       'MarkerEdgeColor','w','MarkerFaceColor','w');
end
if photoCt == 0
    p3 = scatter3(0,0,0,...
       'MarkerEdgeColor','none','MarkerFaceColor','none');
end
for i = 1:99
    p4 = plot3(pth(i:i+1,2),pth(i:i+1,1),[elev(pth(i,1),pth(i,2)) elev(pth(i+1,1),pth(i+1,2))],...
        'm','LineWidth',5);
end

title('Planet 1, Your Solution')

load planet2

subplot(2,2,3)

p0 = surf(elev,'LineStyle','none');
hold all
title('Planet 2, Reference Solution')
for i = 1:50
    for j = 1:50
        if vapor(i,j) > 1000
            p1 = scatter3(j,i,elev(i,j),'MarkerEdgeColor','b',...
                'MarkerFaceColor','b');
        end
    end
end

load planet2reference
for i = 1:soilCt
    p2 = scatter3(soilTrack(i,2),soilTrack(i,1),elev(soilTrack(i,1),soilTrack(i,2)),...
        'MarkerEdgeColor','g','MarkerFaceColor','g');
end
if soilCt == 0
    p2 = scatter3(0,0,0,...
       'MarkerEdgeColor','none','MarkerFaceColor','none');
end
for i = 1:photoCt
    p3 = scatter3(photoTrack(i,2),photoTrack(i,1),elev(photoTrack(i,1),photoTrack(i,2)),...
       'MarkerEdgeColor','w','MarkerFaceColor','w');
end
if photoCt == 0
    p3 = scatter3(0,0,0,...
       'MarkerEdgeColor','none','MarkerFaceColor','none');
end
for i = 1:99
    p4 = plot3(pth(i:i+1,2),pth(i:i+1,1),[elev(pth(i,1),pth(i,2)) elev(pth(i+1,1),pth(i+1,2))],...
        'm','LineWidth',5);
end


subplot(2,2,4)
p0 = surf(elev,'LineStyle','none');
hold all
for i = 1:50
    for j = 1:50
        if vapor(i,j) > 1000
            p1 = scatter3(j,i,elev(i,j),'MarkerEdgeColor','b',...
                'MarkerFaceColor','b');
        end
    end
end

pos = [25 25];
%0 = north, 2 = south, 1 = east, 3 = west
dir = 0;
soilCt = 0;
photoCt = 0;
for i = 1:100
    pth(i,:) = pos;
    el = elev(pos(1),pos(2));
    wa = vapor(pos(1),pos(2));
    if dir == 0
        waterData = [vapor(pos(1),pos(2)-1) vapor(pos(1)+1,pos(2)) vapor(pos(1),pos(2)+1)];
        elevData = [elev(pos(1),pos(2)-1) elev(pos(1)+1,pos(2)) elev(pos(1),pos(2)+1)];
    elseif dir == 1
        waterData = [vapor(pos(1)-1,pos(2)) vapor(pos(1),pos(2)+1) vapor(pos(1)+1,pos(2))];
        elevData = [elev(pos(1)-1,pos(2)) elev(pos(1),pos(2)+1) elev(pos(1)+1,pos(2))];
    elseif dir ==2
        waterData = [vapor(pos(1),pos(2)+1) vapor(pos(1)-1,pos(2)) vapor(pos(1),pos(2)-1)];
        elevData = [elev(pos(1),pos(2)+1) elev(pos(1)-1,pos(2)) elev(pos(1),pos(2)-1)];
    else
         waterData = [vapor(pos(1)+1,pos(2)) vapor(pos(1),pos(2)-1) vapor(pos(1)-1,pos(2))];
        elevData = [elev(pos(1)+1,pos(2)) elev(pos(1),pos(2)-1) elev(pos(1)-1,pos(2))];
    end
    [newD,soil,photo] = feval([netid 'Rover'],waterData,elevData,wa,el);
    switch newD
        case 'L'
            dir = mod(dir-1,4);
        case 'R'
            dir = mod(dir+1,4);
    end
    if soil
        soilCt = soilCt + 1;
        soilTrack(soilCt,:) = pos;
    end
    if photo
        photoCt = photoCt + 1;
        photoTrack(photoCt,:) = pos;
    end
    if dir == 0
        pos(1) = pos(1)+1;
    elseif dir == 1
        pos(2) = pos(2)+1;
    elseif dir == 2
        pos(1) = pos(1)-1;
    else
        pos(2) = pos(2)-1;
    end
end

for i = 1:soilCt
    p2 = scatter3(soilTrack(i,2),soilTrack(i,1),elev(soilTrack(i,1),soilTrack(i,2)),...
        'MarkerEdgeColor','g','MarkerFaceColor','g');
end
if soilCt == 0
    p2 = scatter3(0,0,0,...
       'MarkerEdgeColor','none','MarkerFaceColor','none');
end
for i = 1:photoCt
    p3 = scatter3(photoTrack(i,2),photoTrack(i,1),elev(photoTrack(i,1),photoTrack(i,2)),...
       'MarkerEdgeColor','w','MarkerFaceColor','w');
end
if photoCt == 0
    p3 = scatter3(0,0,0,...
       'MarkerEdgeColor','none','MarkerFaceColor','none');
end
for i = 1:99
    p4 = plot3(pth(i:i+1,2),pth(i:i+1,1),[elev(pth(i,1),pth(i,2)) elev(pth(i+1,1),pth(i+1,2))],...
        'm','LineWidth',5);
end

title('Planet 2, Your Solution')