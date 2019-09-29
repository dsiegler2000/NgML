function processedData = processData(rawData)

processedData = [];
averageAge = 44;

for i = 1:height(rawData)
    row = rawData(i, :);
    gender = 0;
    embarked = 0;
    age = rawData.Age(i);
    if strcmp(row.Sex, 'male')
        gender = 1;
    end
    
    if strcmp(row.Embarked, 'C')
        embarked = 1;
    elseif strcmp(row.Embarked, 'Q')
        embarked = 2;
    end
    
    if strcmp(age, '') || isnan(age)
        age = averageAge;
    end
    
    pClass = rawData.Pclass(i);
    sibSp = rawData.SibSp(i);
    parch = rawData.Parch(i);
    fare = rawData.Fare(i);
    survived = rawData.Survived(i);
    line = [pClass, gender, age, sibSp, parch, fare, embarked, survived];
    processedData = [processedData; line];
    % for now purge Ticked and Cabin
end

end