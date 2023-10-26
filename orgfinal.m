
clear

diretorio_base = 'G:\Gabrielly_PIBIC\Testes\FOutput\0.FINAL\MASKS';
cd(diretorio_base)
pastas = dir(diretorio_base);

count = 106;

for i=3:size(pastas,1)
    cd(pastas(i).name)
    list = dir('*.png');
        for j=1:size(list,1)
            arquivo = list(j).name;
            novo_nome = sprintf('%d.png', count);
            if ~exist(novo_nome,"file")
                movefile(arquivo,novo_nome,"f");
                count = count + 1;
            else
                count = count + 1;
                continue
            end
        end
        cd ..
end