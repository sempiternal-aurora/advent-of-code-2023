use std::fs;
use std::convert::TryInto;

pub struct Card {
    id: usize,
    winning_numbers: Vec<usize>,
    numbers: Vec<usize>,
}

impl Card {
    pub fn num_matches(&self) -> usize {
        let mut num: usize = 0;
        for number in &self.numbers {
            if self.winning_numbers.contains(&number) {
                num = num + 1;
            }
        }
        return num;
    }

    pub fn value(&self) -> usize {
        let num = self.num_matches();
        if num != 0 {
            let base: usize = 2;
            return base.pow((num - 1).try_into().unwrap());
        } else {
            return 0;
        }
    }

    pub fn new_cards(&self) -> Vec<usize> {
        return (1..self.num_matches()).map(|x| x + self.id).collect();
    }
}

fn make_card(line: &str) -> Card {
    println!("{}", line);
    let mut iter = line.split([':', '|']);
    let card_num_slice = &iter.next()
                            .expect("Line should not be empty")
                            .strip_prefix("Card")
                            .expect("Should have card number")
                            .trim_start_matches(char::is_whitespace);
    let id: usize = card_num_slice.parse::<usize>().expect("Should have a valid number");
    let winning_numbers: Vec<usize> = iter.next()
                            .expect("Line should contain magic numbers")
                            .split_whitespace()
                            .map(str::parse::<usize>)
                            .map(|x| x.expect("Must have magic numbers"))
                            .collect();
    let numbers: Vec<usize> = iter.next()
                            .expect("Line should contain numbers")
                            .split_whitespace()
                            .map(str::parse::<usize>)
                            .map(|x| x.expect("Must have numbers"))
                            .collect();
    return Card {
        id: id,
        winning_numbers: winning_numbers, 
        numbers: numbers,
    };
}

fn main() {
    let file_path = "input";

    let contents = fs::read_to_string(file_path).expect("Should have been able to read file");

    let cards: Vec<Card> = contents.split('\n').map(make_card).collect();

    let value: usize = cards.iter().map(Card::value).sum();

    let mut final_cards: Vec<usize> = cards.iter().map(|_x| 1).collect();

    let mut i: usize = 0;
    while i < cards.len() {
        for x in i+1..cards[i].num_matches()+i+1 {
            final_cards[x] = final_cards[x] + final_cards[i];
        }
        i += 1;
    }

    let total_cards: usize = final_cards.iter().sum();

    println!("{:?}", value);

    println!("{}", total_cards);
}