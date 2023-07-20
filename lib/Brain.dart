import 'Questions.dart';

class Brain{
  int _QuestionsNumber = 0;
List <Questions> QuestionsBank = [
  Questions(q: 'Sharks are mammals.', a:false, h:'they are actually classified as fish.' ),
  Questions(q:'Sea otters have a favorite rock they use to break open food.',a: true, h: 'they keep these treasures in the loose skin under their arms'),
  Questions(q: 'The blue whale is the biggest animal to have ever lived.', a: true, h: 'and that includes dinosaurs!'),
  Questions(q: 'The hummingbird egg is the world\'s smallest bird egg.', a: true, h: 'on the flip side, ostriches lay the largest eggs.'),
  Questions(q: 'Pigs roll in the mud because they don’t like being clean.', a: false, h: ' pigs have few sweat glands and their muddy baths help keep them cool.'),
  Questions(q: 'Bats are blind.', a: false, h: ' bats often find their way using ultrasound but their eyes work, just not particularly well).'),
  Questions(q: 'A dog sweats by panting its tongue.', a: false, h: 'canines sweat through glands in their paws.'),
  Questions(q: 't takes a sloth two weeks to digest a meal.', a: true, h: 'that’s the slowest digestion time of any mammal!'),
  Questions(q: 'The largest living frog is the Goliath frog of West Africa.', a: true , h: ' this amphibian reaches lengths of 12.5 inches and weighs 7.2 pounds.'),
  Questions(q: 'The largest living frog is the Goliath frog of West Africa.', a: true, h:' this amphibian reaches lengths of 12.5 inches and weighs 7.2 pounds.' ),
  Questions(q: 'An ant can lift 1,000 times its body weight.', a: false, h: 'ants can lift 5,000 times their body weight!'),
  Questions(q: 'When exiting a cave, bats always go in the direction of the wind.', a:false , h: 'bats always turn left out of a cave.'),
  Questions(q: 'Galapagos tortoises sleep up to 16 hours a day.', a: true , h: 'and they can go a year without food or water, so they have lots of time for extra sleep.'),
  Questions(q: 'An octopus has seven hearts.', a: false, h: 'it has three hearts and they do a lot of work. One heart circulates blood around the body and the other two pump blood past the gills and pick up oxygen.'),
  Questions(q: 'The goat is the national animal of Scotland.', a: false, h: 'it is the unicorn.'),
  Questions(q: 'Herbivores are animal eaters', a: false, h: 'herbivores only eat plants.'),
  Questions(q: 'A monkey was the first non-human to go into space.', a: false, h: 'fruit flies were the first to make the trip'),
  Questions(q: 'New York City is composed of between 36 and 42 islands.', a: true, h:'New York has three main islands: Manhattan Island, Staten Island and part of Long Island, and it also has a number of smaller islands within each borough.'),
  Questions(q: 'South Africa has one capital.', a: false, h: 'it has three: Pretoria, Cape Town, and Bloemfontein.'),
  Questions(q: 'The Atlantic Ocean is the biggest ocean on Earth.', a: false, h: ' the Pacific Ocean is the largest ocean covering more than 60 million square miles.')
];

void NextQuestion(){
  if (_QuestionsNumber < QuestionsBank.length)
    { _QuestionsNumber++;}
}

String getQuestionsText (){
  return QuestionsBank[_QuestionsNumber].question;
}

bool getAnswerText (){
  return QuestionsBank[_QuestionsNumber].answer;
}

String getHitsQuestions(){
  return QuestionsBank[_QuestionsNumber-1].hits;
}

void resetQuiz(){
  _QuestionsNumber = 0;
}

}

