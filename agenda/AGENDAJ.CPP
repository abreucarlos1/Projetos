#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <ctype.h>

struct cadastro
{
	char  nome[50],
		  endereco[100],
		  bairro[80],
		  cidade[80],
		  telefone[9];
};

#define TAMINIC 50
void menu(int*);
void cadastra (struct cadastro*, int*, int *);
void listar (struct cadastro*);
void abrir (struct cadastro*, int*);
void salvar (struct cadastro*, int);

void main (void)

{
	/*alocacao dinamica*/
	struct cadastro * agenda=NULL;
	int 
		n_max_inclusao=TAMINIC, /*numero maximo de veiculos*/
		n_inclusao=0, /*numero de veiculos cadastrados*/
		choice=0;
	/*verifica se o ponteiro foi alocado*/
		agenda=(struct cadastro*) calloc (TAMINIC, sizeof (struct cadastro*));
		if (agenda) /*if para (agenda! = null()*/
			{
				menu(&choice);
				while (choice!=0)
					{
						if (choice==1)
							{
								cadastra(agenda,&n_inclusao,&n_max_inclusao);
								salvar(agenda,n_inclusao);
							}
						else
							if (choice==2)
								{
									listar(agenda);
								}
							else
								abrir(agenda,&n_inclusao);
						menu(&choice);
					}
			}	/*fim do if*/

		if (agenda) free (agenda);

} /*fim do programa*/

void menu(int *choice)
{
	char key;
	clrscr();
	//mostra op‡äes de menu
	printf(" %s\n %s\n %s\n %s\n","1 = Insere Registro", "2 = Lista Registro","3 = Abre arquivo registro","0 = Sair");
	printf("%s","Entre com a op‡Æo: ");
	scanf("%d",choice);
}

void listar (struct cadastro *agenda)
{
	int indice=NULL;
	char key=NULL;
	clrscr();
	printf("Entre com o indice: ");
	scanf("%d",&indice);
	printf("%s %s\n","Nome: ",agenda[indice].nome);
	printf("%s %s\n","Endere‡o: ",agenda[indice].endereco);
	printf("%s %s\n","Bairro: ",agenda[indice].bairro);
	printf("%s %s\n","Cidade: ",agenda[indice].cidade);
	printf("%s %s\n","Telefone: ",agenda[indice].telefone);
	key=getch();
}

void cadastra (struct cadastro *A, int * n_inclusao, int * n_max_inclusao)
{
	int max = TAMINIC;
	if (*n_inclusao == *n_max_inclusao)
		{
			/*para alocar mais memoria*/
			A= (struct cadastro*)realloc(A,(*n_inclusao + max) * sizeof(struct cadastro));
			if (A)
				{
					n_max_inclusao+=TAMINIC;
				}
			else
				{
					printf ("\n CADASTRO LOTADO");
				}
}
		/* fim do primeiro if*/

	flushall();

	printf ("\n Nome:");
	gets (A[*n_inclusao].nome);
	
	printf ("\n Endere‡o:");
	gets (A[*n_inclusao].endereco);

	printf ("\n Bairro:");
	gets (A[*n_inclusao].bairro);

	printf ("\n Cidade:");
	gets (A[*n_inclusao].cidade);

	printf ("\n Telefone:");
	gets (A[*n_inclusao].telefone);
	*n_inclusao+=1;

} /* fim cadastra */

void salvar (struct cadastro *A, int n_regs)
{
	int i;
	FILE *ptr_saida;
	ptr_saida=fopen ("agenda.txt","a"); /*tentativa de abrir arquivo*/
	if (ptr_saida) /*arquivo criado*/
		{

			for (i=0; i<n_regs;i++)
				{
					fprintf(ptr_saida,"%s \n",A[i].nome);
					fprintf(ptr_saida,"%s \n",A[i].endereco);
					fprintf(ptr_saida,"%s \n",A[i].bairro);
					fprintf(ptr_saida,"%s \n",A[i].cidade);
					fprintf(ptr_saida,"%s \n",A[i].telefone);
				} 
				/*fim do for*/
			fclose(ptr_saida);/*fecha*/
		}


/*fim salvar*/
}

void abrir (struct cadastro *A, int *n_inclusao)
{
	FILE *ptr_entr;
	n_inclusao=0;
	ptr_entr=fopen ("agenda.txt","r"); /*tentativa de abrir arquivo*/
	if (ptr_entr) /*arquivo criado*/
		{

			while (!feof(ptr_entr))
				{
					fscanf(ptr_entr,"%s",A[*n_inclusao].nome);
					fscanf(ptr_entr,"%s",A[*n_inclusao].endereco);
					fscanf(ptr_entr,"%s",A[*n_inclusao].bairro);
					fscanf(ptr_entr,"%s",A[*n_inclusao].cidade);
					fscanf(ptr_entr,"%s",A[*n_inclusao].telefone);
					*n_inclusao+=1;
				}
				/*fim do for*/
			fclose(ptr_entr);/*fecha*/
		}


/*fim salvar*/
}


