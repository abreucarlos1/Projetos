/* Programa Agenda */
/* Jo∆o Paulo Torralbo - 123748 */

# include <stdio.h>
# include <stdlib.h>
# include <conio.h>
# include <string.h>

struct addr
{
	char nome[80];
	char endereco[80];
	char bairro[50];
	char cidade[50];
	char telefone[10];
	struct addr *next;    /* ponteiro da prox entrada */
	struct addr *prior;   /* ponteiro p/ entrada anterior */
} lista;
struct addr *start;   /* primeiro da lista */
struct addr *last;    /* ultimo da lista */
struct addr *null;

int menu(void);
void inclusao();
void entrada(char *, char *, int);
void deletar();
void listar();
void achar();
void mostrar(struct addr *);
void salvar();
void carregar();
struct addr *procura(char *);



main()
{
	int choice;
	null = (struct addr *)malloc(sizeof(lista));
	do {
			choice = menu();
			switch(choice) {
				case 1 :
							inclusao();
							break;
				case 2 :
							deletar();
							break;
				case 3 :
							listar();
							break;
				case 4 :
							achar();
							break;
				case 5 :
							salvar();
							break;
				case 6 :
							carregar();
							break;
				case 7 :
							exit(0);
         }
	} while(1);
} 

int menu(void)
{
	char s[80];
	clrscr();
	int c;
	printf("1. Inserir Nomes\n");
	printf("2. Retirar Nomes\n");
	printf("3. Listar  Nomes\n");
	printf("4. Procurar Nome\n");
	printf("5. Salvar Arquivo\n");
	printf("6. Carregar Arquivo\n");
	printf("7. Finalizar\n");
	do {
		printf("\nSua opcao: ");
		gets(s);
		c = atoi(s);
	} while (c < 0 || c > 7);
	return c;
}

void inclusao()
{ 
	struct addr *info;
	//char *malloc();
	do {
		clrscr();
		info = (struct addr *)malloc(sizeof(lista));
		if (info == 0)
			{
				printf("\nMemoria Esgotada!");
				exit(0);
			}
		entrada("Entre Nome: ",info->nome,80);
		if (!info->nome[0])
			break;
		entrada("Entre Endereco: ",info->endereco,80);
		entrada("Entre Bairro: ",info->bairro,50);
		entrada("Entre Cidade: ",info->cidade,50);
		entrada("Entre Telefone: ",info->telefone,10);
		if (start!=0)
			{
				last->next = info;
				info->prior = last;
				last = info;
				last->next = null;
			}
		else
			{
				start = info;
				start->next = null;
				last = start;
				start->prior = null;
			}
	} while(1);
}

void entrada(char *prompt, char *s ,int count)
{
	char p[255];
	do {
		printf(prompt);
		gets(p);
		if (strlen(p) > count)
			puts("Muito Grande!");
	} while (strlen(p) > count);
	strcpy(s,p);
}

void deletar()
{
	struct addr *info, *find();
	char s[255];
	int volta;
	entrada("Entre Nome: ",s,80);
	info = procura(s);
	if (info)
		{
			if (start == info)
				{
					start = info->next;
					start->prior = null;
				}
			else
				{
					info->prior->next = info->next;
					if (info != last)
						info->next->prior = info->prior;
					else
						last = info->prior;
				}
			free(info);
		}
}

struct addr *procura(char *nome)
//char *nome;
{
	struct addr *info;
	info = start;
	while (info && info != null)
		{
			if (!strcmp(nome,info->nome))
				return info;
			info = info->next;
		}
return null;
} 

void listar()
{
	int t;
	struct addr *info;
	info = start;
	while (info && info != null)
		{
			mostrar(info);
			getch();
			info = info->next;
		}
	printf("\n\n");
}

void achar()
{
	struct addr *info,*find();
	char s[255];
	entrada("Entre Nome: ",s,80);
	info = procura(s);
	if (info != null)
		mostrar(info);
	else
		printf("Nao Encontrado!\n");
}

void mostrar(struct addr *info)
//struct addr *info;
{                           
	printf("%s\n",info->nome);
	printf("%s\n",info->endereco);
	printf("%s\n",info->bairro);
	printf("%s\n",info->cidade);
	printf("%s\n",info->telefone);
	printf("\n\n");
}

void salvar()
{
	int t,size;
	struct addr *info;
	char *p;
	FILE *fp;
	if ((fp = fopen("cadastro.txt","w")) == 0)
		{
			puts("Falhou a Abertura!");
			exit(0);
		}
	printf("Salvando Arquivo\n");
	size = sizeof(lista);
	info = start;
	while (info && info != null)
		{
			p = (char *)info; /* convesao p/ ponteiro de caracter */
			for (t=0;t<size-1;++t)
				putc(*p++,fp); /* salva um byte */
			info = info->next; /* proximo */
    	}
	putc(EOF,fp); /* marcando fim de arquivo ... opcional */
	fclose(fp);
	getch();
}

void carregar()
{
	int t,size;
	struct addr *info,*temp;
	char *p;//*malloc();
	FILE *fp;
	if ((fp = fopen("cadastro.txt","r")) == 0)
		{
			puts("Falhou Abertura");
			exit(0);
    	}
	printf("Carregando Arquivo\n");
	size = sizeof(lista);
	start = (struct addr *)malloc(size);
	if (!start)
		{
			puts("Acabou Memoria! ");
			return;
		}
	info = start;
	p = (char *)info; /* ponteiro para caracter */
	while ((*p++ = getc(fp)) != EOF)
		{
			for (t=0;t<size-2;++t)
				*p++ = getc(fp); /* carrega byte a byte */
			info->next = (struct addr *)malloc(size); /* aloca mais memoria */
			if (!info->next)
				{
					printf("Memoria Esgotada!\n");
					return;
		      }
			info->prior = temp;
			temp = info;
			info = info->next;
			p = (char *)info;
			if (info == null)
				break;
		}
	free(temp->next);
	temp->next = null;
	last = temp;
	start->prior = null;
	fclose(fp);
	getch();
}
