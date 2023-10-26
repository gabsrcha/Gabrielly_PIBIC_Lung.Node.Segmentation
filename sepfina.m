clear

diretorio_base = 'G:\Gabrielly_PIBIC\Testes\FOutput\0.FINAL\RESTOSLICES';
cd(diretorio_base)
pastas = dir(diretorio_base);
train = 'G:\Gabrielly_PIBIC\Testes\FOutput\0.FINAL\TRAIN2';
test = 'G:\Gabrielly_PIBIC\Testes\FOutput\0.FINAL\VALID2';

count = 0

%for i=3:size(pastas,1)
    %cd(pastas(i).name)
    list = dir('*.png');
        for j=1:size(list,1)
            count = count + 1;
            while(count<=80)
                arquivo = list(j).name;
                copyfile(arquivo,train);
                break;
            end
                if count>73
                    arquivo = list(j).name;
                    copyfile(arquivo,test);
                end
        end
        cd ..
%end