%% Leitura de dados
clear variables

tabnod = readtable("G:\Gabrielly_PIBIC\list3.2.xls");
cd 'G:\Gabrielly_PIBIC\Dataset_Pulmao\LIDC-IDRI\' 
fdataset = dir('G:\Gabrielly_PIBIC\Dataset_Pulmao\LIDC-IDRI\')
pasta = zeros([4,4])
% ui = zeros([])
clevel = 0.1;


%% ENTRAR EM PASTA EM PASTA
for i=3:size(fdataset,1)
    cd 'G:\Gabrielly_PIBIC\Dataset_Pulmao\LIDC-IDRI\' 
    nomeArquivoDir = fdataset(i).name;
    x = string(tabnod.Var1);
    %     for t=1:size(x)
    xs = string(split(nomeArquivoDir,'-'));
    %     end
    
    
    enc = find(x==xs(3))
    %     a = strfind(tabnod(i,"Var1"), fdataset(i).name);
    %     for j = 1:size(tabnod, 1)
    
    %% ENTRAR NAS PASTAS COM BASE NAS REPETICOES
    for m=1:size(enc,1)
        %         clear variable pasta
        j = enc(m)
        
        % Obtendo o nome do arquivo da tabela de nódulos
        nomeArquivoTab = tabnod.Var1{j};
        
        % Obtendo o nome do arquivo atual no diretório
        nomeArquivoDir = fdataset(i).name;
        
        %% Verificando os sliceS
        slice = table2array(tabnod(j,"Var8"));
        pasta = dir(nomeArquivoDir);
        cd 'G:\Gabrielly_PIBIC\Dataset_Pulmao\LIDC-IDRI\' 
        cd(nomeArquivoDir)
        if isempty(pasta)
        pasta = dir
        end
        cp = strcat('G:\temp-',string(nomeArquivoDir));
        mkdir(cp)
        
        %% VERIFICAR A PASTA DE ACORDO COM A TABELA (SALVAR O SLICE NO LUGAR CERTO)
        for k=3:4
            if k>size(pasta)
            break
            end
            
            cd(pasta(k).name)
            subpasta = dir;
            if ~isempty(strfind(subpasta(3).name,string(tabnod.Var2(j)))) 
            cd(subpasta(3).name)
            listaarq = dir;
            
            if slice<100
            slc = strcat('1-0',string(slice));
            else
            slc = strcat('1-',string(slice));
            end
            dcm_file = which(strcat(slc,'.dcm'));
            if isempty(dcm_file)
            break
            end
            %                 copyfile(dcm_file, cp)
            getslice=dicomread(dcm_file);
            getslice0=mat2gray(getslice);
            if exist(strcat('G:\Gabrielly_PIBIC\Testes\FOutput\',string(nomeArquivoDir)))

                renameslice=strcat(strcat('G:\Gabrielly_PIBIC\Testes\FOutput\',string(nomeArquivoDir),'\'), strcat(slc,'.dcm'),'-', string(tabnod.Var3(j)));
            else
                break;
            end
%             imad = imadjust(getslice0);
            imad = imadjust(getslice0, stretchlim(getslice0, [0.01, 0.99]), [], 1.5);

%             imshow(getslice0,[]);
            imshow(imad,[]);
            disp(dcm_file)
            imwrite(imad,strcat(renameslice,'.png'),"png");
            cd ..
            cd ..
            
            else
            cd ..
            end 
        
        end
        
        %% COMECAR A BRINCADEIRA DAS MASCARAS HAHAHAH
        cd 'G:\Gabrielly_PIBIC\Anot_Dataset_Pulmao\manifest-1585232716547\LIDC-IDRI'
        pasta_mask = dir(nomeArquivoDir);
        cd (nomeArquivoDir)
        cd(pasta_mask(3).name)
        subp = dir;
        MASCARAS = struct();
        p=1;
        r=1;
        l=3;
        q=0;
        cont_mask=0;

        %% VERIFICAR QUAIS PASTAS CONDIZEM COM OS NODULOS DO PACIENTE (SALVA AS MASCARAS NUMA PASTA)
       while (l<=size(subp,1))

        for l=3:size(subp,1)
            for col = 10 : 14
                this=tabnod(j,col);
                this= table2array(this);
                testa = strcmp(this,'');
                
                if testa == 1
                break
                end


                folder=strcat('Segmentation of Nodule'," ",string(tabnod.Var3(j)),' - Annotation'," ",string(this));
                folder= erase(folder,"_");              
                
                if ~isempty(strfind(subp(l).name,string(folder)))
%                         disp('é pasta')
                cd(subp(l).name)
                arqmask=dir;
                rename = strcat(cp,'\',string(arqmask(3).name),'-', string(this), '-', string(tabnod.Var3(j)));
                

                %         copyfile(arqmask(3).name,cp)
                get = dicomread(arqmask(3)          # Subplot para a imagem original
          plt.subplot(1, 2, 2)
          plt.imshow(mask)
          plt.axis('off')
          plt.title("Máscara Original").name);
                get0 = get(:,:,:,1);
   
                cd 'G:\Gabrielly_PIBIC'
                FuncSEPARA(get, slice, nomeArquivoDir, this, pasta, tabnod, subpasta,j,arqmask);
                cd(arqmask(3).folder)

                get1(:,:,p ) = get0;
                p=p+1;
                q = q+1;
                
                switch q
                    case 1
                        MASCARAS.masc1 = get0;
                        cont_mask=cont_mask+1;
%                         cont_mask=cont_mask+1;
%                         imshow(MASCARAS.masc1,[]);

                    case 2
                        MASCARAS.masc2 = get0;
%                         imshow(MASCARAS.masc1,[]);
%                         imshow(MASCARAS.masc2,[]);
                        cont_mask=cont_mask+1;
                    case 3
                        MASCARAS.masc3 = get0;
                        cont_mask=cont_mask+1;
%                         imshow(MASCARAS.masc1,[]);
%                         imshow(MASCARAS.masc2,[]);
%                         imshow(MASCARAS.masc3,[]);
                end
                
                
                imshow(get0,[]);
                imwrite(mat2gray(get0),strcat(rename,'.png'),"png");
                %             adresses(r)=strcat(rename,'.jpg');
                %r=r+1;
                
%%

                cd ..
%                 cd ..
                
                end

            end
    
        end

              %% MASCARA MEDIA
                
                % Armazenar as máscaras em uma matriz
                switch cont_mask
                    case 0
                        break
                    case 1
                        mascara_media = MASCARAS.masc1;
                    case 2
                        mascaras = cat(3, MASCARAS.masc1, MASCARAS.masc2);
                        % Criar uma matriz vazia para a máscara média
                        %tamanho = MASCARAS.masc1;
                        mascara_media = zeros(size(MASCARAS.masc1));                                              
                        % Calcular a máscara média
                        for i = 1:size(mascaras, 1)
                            for j = 1:size(mascaras, 2)
                                media(i,j) = mean(mascaras(i, j, :));
                                if media(i,j) >= clevel
                                mascara_media(i, j) = 1; 
                                else
                                mascara_media(i, j) = mean(mascaras(i, j, :));
                                end
                            end
                        end                                                                                                                             
                    case 3
                        mascaras = cat(3, MASCARAS.masc1, MASCARAS.masc2, MASCARAS.masc3);
                        % Criar uma matriz vazia para a máscara média
                        mascara_media = zeros(size(MASCARAS.masc1));                        
                        % Calcular a máscara média
                        for i = 1:size(mascaras, 1)
                            for j = 1:size(mascaras, 2)
                                media(i,j) = mean(mascaras(i, j, :));
                                if media(i,j) >= clevel
                                mascara_media(i, j) = 1; 
                                else
                                mascara_media(i, j) = mean(mascaras(i, j, :));
                                end
                            end
                        end
                end
                
                % Exibir a máscara média
                imshow(mascara_media,[]);
                imwrite(mat2gray(mascara_media),strcat(rename,'_MEDIA.png'),"png");
            cont_mask=0;
       end

    end
end