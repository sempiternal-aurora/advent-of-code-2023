#include <stdio.h>
#include <ctype.h>

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
    int numCards[13];
    for (int i = 0; i < 13; i++) {
        numCards[i] = 0;
    }
    for (int i = 0; i < 5; i++) {
        numCards[handBid->ordering[i]] = numCards[handBid->ordering[i]] + 1;
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
        if (compareRank(&start->handBid, &newItem->handBid) > 0) {

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
        Node * start;
        char iobuffer[32];
    }    
    else {
        fputs("Argument Error, requires 1 argument of HandBid file", stdout);
    }
}
