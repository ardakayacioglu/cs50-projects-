#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Function prototype
bool valid_key(string key);
char substitute(char c, string key);

int main(int argc, string argv[])
{
    // Check for valid usage
    if (argc != 2 || !valid_key(argv[1]))
    {
        printf("Usage: ./substitution key\n");
        return 1;
    }

    // Get key and plaintext
    string key = argv[1];
    string plaintext = get_string("plaintext: ");

    // Print ciphertext
    printf("ciphertext: ");
    for (int i = 0, len = strlen(plaintext); i < len; i++)
    {
        printf("%c", substitute(plaintext[i], key));
    }
    printf("\n");

    return 0;
}

bool valid_key(string key)
{
    if (strlen(key) != 26)
    {
        return false;
    }

    bool used[26] = {false};

    for (int i = 0; i < 26; i++)
    {
        if (!isalpha(key[i]))
        {
            return false;
        }
        int index = toupper(key[i]) - 'A';
        if (used[index])
        {
            return false;
        }
        used[index] = true;
    }
    return true;
}

char substitute(char c, string key)
{
    if (isupper(c))
    {
        return toupper(key[c - 'A']);
    }
    else if (islower(c))
    {
        return tolower(key[c - 'a']);
    }
    else
    {
        return c;
    }
}
