#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>

typedef enum Card {TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, ACE} Card;

typedef enum HandType {HIGH_CARD, ONE_PAIR, TWO_PAIR, TRIPLE, FULL_HOUSE, QUARTET, QUINTET} HandType;

typedef struct HandBid {
    int bid;
    Card ordering[5];
} HandBid;

typedef struct Node {
    struct HandBid handBid;
    struct Node * next;
} LinkedHandBidList;

Card parseCard(char card) {
    if (card == 'A') return ACE;
    else if (card == 'K') return KING;
    else if (card == 'Q') return QUEEN;
    else if (card == 'J') return JACK;
    else if (card == 'T') return TEN;
    else return card - '2';
}

HandType getType(HandBid * handBid) {
    int numCardsBuffer[13] = {0,0,0,0,0,0,0,0,0,0,0,0,0};
    for (int i = 0; i < 5; i++) {
        numCardsBuffer[handBid->ordering[i]] = numCardsBuffer[handBid->ordering[i]] + 1;
    }
    bool has_two = false;
    bool has_three = false;
    for (int i = 0; i < 13; i++) {
        switch (numCardsBuffer[i]) {
            case 5: return QUINTET;
            case 4: return QUARTET;
            case 3:
                if (has_two) {
                    return FULL_HOUSE;
                } else {
                    has_three = true;
                }
                break;
            case 2:
                if (has_three) {
                    return FULL_HOUSE;
                }
                else if (has_two) {
                    return TWO_PAIR;
                }
                else {
                    has_two = true;
                }
                break;
            default:
                break;
        }
    }
    if (has_three) {
        return TRIPLE;
    }
    else if (has_two) {
        return ONE_PAIR;
    }
    else {
        return HIGH_CARD;
    }
}

int compareRank(HandBid * handBid1, HandBid * handBid2) {
    HandType type1 = getType(handBid1);
    HandType type2 = getType(handBid2);
    if (type1 == type2) {
        int comparing = 0;
        while (comparing < 5) {
            if (handBid1->ordering[comparing] == handBid2->ordering[comparing]) {
                comparing++;
            }
            else {
                return handBid1->ordering[comparing] - handBid2->ordering[comparing];
            }
        }
        return 0;
    }
    else {
        return type1 - type2;
    }
}

LinkedHandBidList * insertSorted(LinkedHandBidList * start, LinkedHandBidList * newItem) {
    newItem->next = NULL;
    LinkedHandBidList * nextPtr = start;
    LinkedHandBidList * pastPtr = NULL;
    while (nextPtr) {
        if (compareRank(&nextPtr->handBid, &newItem->handBid) >= 0) {
            newItem->next = nextPtr;
            if (pastPtr == NULL) {
                return newItem;
            }
            else {
                pastPtr->next = newItem;
                return start;
            }
        }
        pastPtr = nextPtr;
        nextPtr = nextPtr->next;
    }
    if (pastPtr) {
        pastPtr->next = newItem;
        return start;
    } else {
        return newItem;
    }
}

int main(int argc, char** args) {
    if (argc == 2) {
        FILE* handBidFile = fopen(args[1], "r");
        LinkedHandBidList * start = NULL;
        char iobuffer[32];
        if (handBidFile) {
            while (fgets(iobuffer, 32, handBidFile) != NULL) {
                printf("%s", iobuffer);
                struct Node * newItem = malloc(sizeof(struct Node));
                for (int i = 0; i < 5; i++) {
                    newItem->handBid.ordering[i] = parseCard(iobuffer[i]);
                }
                newItem->handBid.bid = strtol(&(iobuffer[5]), NULL, 10);
                start = insertSorted(start, newItem);
            }
            fclose(handBidFile);
            LinkedHandBidList * temp = start;
            int winnings = 0;
            int rank = 1;
            while (temp) {
                printf("%d\n", temp->handBid.bid);
                winnings += rank * temp->handBid.bid;
                rank++;
                temp = temp->next;
            }
            printf("winnings: %d", winnings);
        }
        else {
            printf("Error: unable to open file %s \n", args[1]);
        }
    }    
    else {
        printf("Argument Error, requires 1 argument of HandBid file \n");
    }
}
