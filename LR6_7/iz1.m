%Функция проверки согласованности
function con = checkCon(pairwiseComparisons,os)
    pairGeomean = geomean(pairwiseComparisons,2);
    %disp(pairGeomean);
    pairGeomeanNorm = pairGeomean/sum(pairGeomean);

    pairColumnSum = sum(pairwiseComparisons);
    %disp(pairColumnSum);

    labmdaMax = dot(pairGeomeanNorm,pairColumnSum);
    is = (labmdaMax - length(pairwiseComparisons))/(length(pairwiseComparisons)-1);
    con = is/os;
end

function degrees = calcDegrees(pairwiseComparisons)
    pairGeomean = geomean(pairwiseComparisons,2);
    %disp(pairGeomean);
    pairGeomeanNorm = pairGeomean/sum(pairGeomean);
    degrees = pairGeomeanNorm;
end;
function outputString = displayNewFuzzySet(degrees,names,setName)
    outputString = sprintf("%s\n",setName);
    % Форматируем строки для каждого элемента и конкатенируем их
    for i = 1:length(degrees)
        outputString = strcat(outputString,sprintf(" %d | %.2f\n", names(i), degrees(i)));
    end;
end;

function outputString = displayNewFuzzySetStr(degrees,names,setName)
    outputString = sprintf("%s\n",setName);
    % Форматируем строки для каждого элемента и конкатенируем их
    for i = 1:length(degrees)
        outputString = strcat(outputString,sprintf(" %s | %.2f\n", names(i), degrees(i)));
    end;
end;

% По стоимости
names = ["SONY FDR-AX43",
    "Canon XA40",
    "Panasonic HXR",
    "GoPro Hero12",
    "Blackmagic Pocket",
    "JVC GY-HM180E"
    ];
pairwiseComparisonsCost = [
    [1,   1/3, 2,   1/2,  1/3, 1/4],
    [3,   1,   4,   3,    2,   1/5],
    [1/2, 1/4, 1,   1/3,  1/4, 1/5],
    [2,   1/3, 3,   1,    1/3, 1/4],
    [3,   1/2, 4,   3,    1, 1/4],
    [4,   5,   5,   4,    4, 1],
];
disp(checkCon(pairwiseComparisonsCost,1.24));
degreesCost = calcDegrees(pairwiseComparisonsCost);
disp(displayNewFuzzySetStr(degreesCost,names,"Cost"))

% По дизайну
pairwiseComparisonsDesign = [
    [1,   2,   3,   1/3,   1/2, 3],
    [1/2, 1,   2,   1/3,   2,   4],
    [1/3, 1/2, 1,   1/3,   2,   3],
    [3,   3,   3,   1,     3,   4],
    [2,   1/2, 1/2, 1/3,   1,   2],
    [1/3, 1/4, 1/3, 1/4,   1/2, 1],
];
disp(checkCon(pairwiseComparisonsDesign,1.24));
degreesDesign = calcDegrees(pairwiseComparisonsDesign);
disp(displayNewFuzzySetStr(degreesDesign,names,"Design"));

% По прочности

pairwiseComparisonsDurability = [
    [1,   2,   1/3, 1,   1/3, 1/3],
    [1/2, 1,   1/4, 1/3, 1/4, 1/4],
    [3,   4,   1,   3,   1,   1],
    [1,   3,   1/3, 1,   1/3, 1/3],
    [3,   4,   1,   3,   1,   1],
    [3,   4,   1,   3,   1,   1],
];
disp(checkCon(pairwiseComparisonsDurability,1.24));
degreesDurability = calcDegrees(pairwiseComparisonsDurability);
disp(displayNewFuzzySetStr(degreesDurability,names,"Durability"))



% По весу
pairwiseComparisonsWeight = [
    [1,   1/3, 3,   1/2, 2,   1/4],
    [3,   1,   4,   2,   3,   1/2],
    [1/3, 1/4, 1,   1/4, 1/2, 1/6],
    [2,   1/2, 4,   1,   3,   1/2],
    [1/2, 1/3, 2,   1/3, 1,   1/3],
    [4,   2,   6,   2,   3,   1],
];
disp(checkCon(pairwiseComparisonsWeight,1.24));
degreesWeight = calcDegrees(pairwiseComparisonsWeight);
disp(displayNewFuzzySetStr(degreesWeight,names,"Weight"));


% По коррозии
pairwiseComparisonsCorrosion = [
    [1,   3,   1,   3,   1,   4],
    [1/3, 1,   1/3, 1,   1/3, 2],
    [1,   3,   1,   3,   1,   4],
    [1/3, 1,   1/3, 1,   1/3, 2],
    [1,   3,   1,   3,   1,   4],
    [1/4, 1/2, 1/4, 1/2, 1/4, 1],
];
disp(checkCon(pairwiseComparisonsQuality,1.24));
degreesCorrosion = calcDegrees(pairwiseComparisonsQuality);
disp(displayNewFuzzySetStr(degreesCorrosion,names,"Quality"));


% По наценке
pairwiseComparisonsAddcost = [
    [1,   1/3, 2,   1/2,  1/3, 1/4],
    [3,   1,   4,   3,    2,   1/5],
    [1/2, 1/4, 1,   1/3,  1/4, 1/5],
    [2,   1/3, 3,   1,    1/3, 1/4],
    [3,   1/2, 4,   3,    1, 1/4],
    [4,   5,   5,   4,    4, 1],
];
disp(checkCon(pairwiseComparisonsAddcost,1.24));
degreesAddcost = calcDegrees(pairwiseComparisonsAddcost);
disp(displayNewFuzzySetStr(degreesAddcost,names,"Addcost"));




% Сравнение самих критериев
% По весу
names = ["Cost","Design","Durability","Weight","Quality","Addcost"];
pairwiseComparisonsProp = [
    [1,     3,   2,    4,    3,    2],
    [1/3,   1,   1/3,  1/4,  1/3,  1/4],
    [1/2,   3,   1,      4,  2,    2],
    [1/4,   4,   1/4,    1,  1/3,  1/2],
    [1/3,   3,   1/2,    3,  1,    2],
    [1/2,   4,   1/2,    2,  1/2,  1],
];
disp(checkCon(pairwiseComparisonsProp,1.24));
degreesProps = calcDegrees(pairwiseComparisonsProp);
disp(displayNewFuzzySetStr(degreesProps,names,"Props"))
% Финальное вычисление
result = cat(2,degreesCost,degreesDesign,degreesDurability,degreesWeight,degreesCorrosion,degreesAddcost) * degreesProps;
names = ["SONY FDR-AX43",
    "Canon XA40",
    "Panasonic HXR",
    "GoPro Hero12",
    "Blackmagic Pocket",
    "JVC GY-HM180E"
    ];
disp(displayNewFuzzySetStr(result,names,"Jewellery"));
