# Covid - 19 Application

A new Flutter project.

## Logic Behind Calculation
The application consists of 14 diagnostic questions and calculates a score based on a score weight for each particular symptom. For each question/symptom except the first two questions, there is a certain weight attached. The first two questions are risk adjusting factor questions.

Question 1> Are you older than 50 or younger than 5?
() Yes, I am older than 50 years old or young than 5 years old
() No, I am between 5 and 50 years old

If yes, multiply the final result score by 1.35
If no, multiply the final result score by 1 (= don't adjust)

Question 2> Have you been diagnosed with any pre-existing chronic health conditions associated with
outcomes of COVID-19?
(any respiratory disease, any heart disease, hypertension, diabetes, or any immunocompromised
disease)
() Yes, I have pre-existing chronic health conditions
() No, I do not have any of the above chronic conditions

If yes, multiply the final result score by 1.7
If no, multiply the final result score by 1 (= don't adjust)

After these two questions every other question asked adds a fixed constant number(weight) to the final score. The weights for the questions are those published by Researchers at John Hopkins University after careful analysis of peer-reviewed sources.

| Describing Words | Weights |
| --- | --- |
| Fever above 37.8C/100F in armpit or forehead | 93 |
| Dry Cough | 69.5 |
| Fatigue | 53.5 |
| No Appetite | 40 |
| Mild Difficulty Breathing | 35 |
| Sputum (Spitting with lung mucus) | 29.5 |
| Mucle or Bone Pain | 27.5 |
| Sore Throat | 11 |
| Nausea, vomiting, or diarrhea | 24 |
| Loss of Smell or Taste | 15 |
| Chills (Cold or Shivering) | 11 |
| Headache or Dizziness | 10 |

If the Score of the user crosses 212, then there is a significant chance the user depicts Covid-19 symptoms and the app recommends seeing a doctor.



