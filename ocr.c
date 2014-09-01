#include <stdio.h>
#include <stdlib.h>
#include <iostream>

using namespace std;

////////// Global Variables //////////

int x = 0; int y = 0;

int image[53][49];
char buffer[4000];
char postfix[4000];
char infix[4000];

int infixLength = 0;
int buffLength = 0;
int postfixLength = 0;


////////// Read in data //////////

void storeImage()
{
	FILE *infile;
	infile = fopen("test.txt", "r");

	if (infile == NULL)  
	{
		printf("error reading file");
	}

	int ch = getc(infile);
	while ( ch != EOF)
	{
		if(ch == '0')
		{
			image[x][y] = 0;
			y++;
		} 
		else if(ch == '1')
		{
			image[x][y] = 1;
			y++;
		}
		else if(ch == '\n')
		{
			x++;
			y = 0;
		}
		else
		{
			ch = getc(infile);
			continue;
		}
		ch = getc(infile);
	}
	system("PAUSE");
}
void printImage()
{
	for(int i = 0; i < 49; i++)
	{
		for(int j = 0; j < 53; j++)
		{
			printf("%d",image[i][j]);
		}
		printf("\n");
	}	
}
void bufferLength()
{
	int i = 0;
	while(buffer[i] != 0)
	{
		buffLength++;
		i++;
	}
}
void shiftBufferValuesByTwo()
{
	for(int i=0; i < buffLength; i+=2)
	{
		buffer[i] = buffer[i]+2;
	}
}
void storeBuffer()
{
	FILE *infile;
	infile = fopen("test2.txt", "r");

	if (infile == NULL)  
	{
		printf("error reading buffer");
	}

	fscanf(infile, "%s", buffer);
	bufferLength();
	fclose(infile);
}
void printBuffer()
{
	for(int i = 0; i < buffLength; i++)
		printf("%c", buffer[i]);
}
void getInfixLength()
{
	int i = 0;
	while(buffer[i] != 0)
	{
		infixLength++;
		i++;
	}
}
void storeInfix()
{
	int index0 = 0;
	int index1 = 1;
	int i = 0;

	while(index1 < buffLength)
	{
		if(buffer[index0] == '5')
		{
			infix[i] = buffer[index1]+2;
		}
		else if (buffer[index0] == '4')
		{
			if(buffer[index1] == '2')
			{
				infix[i] = 42;
			}
			else if (buffer[index1] == '3')
			{
				infix[i] = 43;
			}
			else if (buffer[index1] == '5')
			{
				infix[i] = 45;
			}
			else if (buffer[index1] == '7')
			{
				infix[i] = 47;
			}
			else if (buffer[index1] == '8')
			{
				infix[i] = 48;
			}
			else if (buffer[index1] == '9')
			{
				infix[i] = 49;
			}
		}
		else if (buffer[index0] == '6')
		{
			infix[i] = 61;
		}

		index0 += 3;
		index1 += 3;
		i++;
	}
	getInfixLength();
}

////////// Implement Stack  //////////

typedef struct Stack
{
	int capacity;
	int size;
	int* elements;
}Stack;

Stack* createStack(int maxElements)
{
        /* Create a Stack */
        Stack *S;
        S = (Stack *)malloc(sizeof(Stack));
        /* Initialise its properties */
        S->elements = (int *)malloc(sizeof(int)*maxElements);
        S->size = 0;
        S->capacity = maxElements;
        /* Return the pointer */
        return S;
}

void pop(Stack *S)
{
        /* If stack size is zero then it is empty. So we cannot pop */
        if(S->size==0)
        {
                printf("Stack is Empty\n");
                return;
        }
        /* Removing an element is equivalent to reducing its size by one */
        else
        {
                S->size--;
        }
        return;
}

int top(Stack *S)
{
        if(S->size==0)
        {
                printf("Stack is Empty\n");
                exit(0);
        }
        /* Return the topmost element */
        return S->elements[S->size-1];
}

void push(Stack *S,int element)
{
        /* If the stack is full, we cannot push an element into it as there is no space for it.*/
        if(S->size == S->capacity)
        {
                printf("Stack is Full\n");
        }
        else
        {
                /* Push an element on the top of it and increase its size by one*/ 
                S->elements[S->size++] = element;
        }
        return;
}

bool isEmpty(Stack *S)
{
	if(S->size == 0)
		return true;
	else
		return false;
}

/////////////////////////////////////

bool isOperator(int op)
{
	if(op == '+' || op == '-' || op == '*' || op == '/')
		return true;
	else 
		return false;
}

bool isOperand(int op)
{
	if(op == '0' || op == '1' || op == '2' || op == '3' || op == '4' || op == '5' || op == '6' || op == '7' || op == '8' || op == '9')
		return true;
	else 
		return false;
}

int precedence(int op) 
{
	switch (op)
	{
	case '+': return 1;
	case '-': return 1;
	case '*': return 2;
	case '/': return 2;

	default: return 0;
	}
}

bool isHigherPrecedence(int topOfStack, int infix) 
{
	if(precedence(topOfStack) >= precedence(infix)) 
		return true;
	else 
		return false;
}

int evaluateExpression(char operand, int temp1, int temp2)
{
	switch(operand)
	{
	case '*':
		return temp1 * temp2;
	case '+':
		return temp1 + temp2;
	case '-':
		return temp1 - temp2;
	case '/':
		return temp1 / temp2;
	default:
		return 0;
	}
}

int convertAsciiNumToDecimal(int Ascii)
{
		if(Ascii == 48)
			return 0;
		else if(Ascii == 49)
			return 1;
		else if(Ascii == 50)
			return 2;
		else if(Ascii == 51)
			return 3;
		else if(Ascii == 52)
			return 4;
		else if(Ascii == 53)
			return 5;
		else if(Ascii == 54)
			return 6;
		else if(Ascii == 55)
			return 7;
		else if(Ascii == 56) 
			return 8;
		else if(Ascii == 57)
			return 9;
		else
			return -1;
}

///////////////////////////////////

void createPostfix()
{
	// Initialize an empty stack
	Stack* S = createStack(infixLength); 

	int count = 0;
	int index = 0;
	// Scan the infix string from left to right
	while(count < infixLength)
	{
		// If the scanned character is an operand, add it to the Postfix string
		if(isOperand(infix[count]) == true)
		{
			postfix[index] = infix[count];
			index++;
		}
		else if(isOperator(infix[count]) == true)
		{
			if(isEmpty(S) == true)
				push(S,infix[count]);
			else
			{
				while(isEmpty(S) == false && isHigherPrecedence(top(S),infix[count]) == true )
				{
					postfix[index] = top(S);
					pop(S);
					index++;
				}
				push(S,infix[count]);
			}
		}
		else // it is an equal sign so stop
			break;
		count++;
	}
	//After all characters are scanned, we have to add any character that the stack may have
	// to the postfix string
	
	int j = index;
	while(isEmpty(S) != true)
	{
		postfix[j] = top(S);
		pop(S);
		j++;
	}
} 

void printPostfix()
{
	for(int i = 0; i < infixLength; i++)
		printf("%c", postfix[i]);
}

void getPostfixLength()
{
	int i = 0;
	while(buffer[i] != 0)
	{
		postfixLength++;
		i++;
	}
} 

int evaluatePostfix()
{
	// Initialize an empty stack

	Stack* E = createStack(100);
	int Val = 0;
	int i = 0;

	while(postfix[i] != 0)
	{
		if(isOperand(postfix[i]) == true)
		{
			int temp = convertAsciiNumToDecimal(postfix[i]);
			push(E,temp);
		}
		else
		{
			int secondArg = top(E);
			pop(E);
			int firstArg = top(E);
			Val = evaluateExpression(postfix[i], firstArg, secondArg);
			push(E, Val);
		}
		i++;
	}
	printf("%d",Val);
	return Val;
}

void main()
{}
