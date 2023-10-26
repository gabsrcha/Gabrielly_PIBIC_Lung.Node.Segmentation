clear


diretorio_base = 'G:\Gabrielly_PIBIC\Testes\FOutput\0.FINAL\MASKS';

% Lista todos os diretórios no diretório base
pastas = dir(diretorio_base);
pastas = pastas([pastas.isdir]);

% Loop através das pastas
for i = 1:numel(pastas)
    pasta = pastas(i);
    nome_pasta = pasta.name;
    
    % Verifica se o nome da pasta contém "- INV"
    if contains(nome_pasta, '- INV')
        % Entra na pasta
        cd(fullfile(diretorio_base, nome_pasta));
        
        % Lista todos os arquivos JPG na pasta
        arquivos_jpg = dir('*.png');
        
        % Ordena os arquivos por data de modificação (ordem decrescente)
%         [~, idx] = sort([arquivos_jpg.datenum], 'descend');
%         arquivos_jpg = arquivos_jpg(idx);
        nome =1;
        % Renomeia os arquivos JPG em ordem decrescente
        for j = size(arquivos_jpg,1):-1:1
            arquivo = arquivos_jpg(j);
            novo_nome = sprintf('%d.png', nome); % Você pode personalizar o novo nome aqui
            movefile(arquivo.name, novo_nome);
            nome=nome+1;
        end
        
        % Volta para o diretório base
        cd(diretorio_base);
    end
end

