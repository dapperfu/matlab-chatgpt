% Replace YOUR_API_KEY with your OpenAI API key
apikey = 'YOUR_API_KEY';

% Specify the question and context in which it should be answered
question = 'What is the capital of France?';
context = 'France is a country in Europe with a population of over 67 million people. Its official language is French and its currency is the euro. France is known for its iconic landmarks such as the Eiffel Tower and the Louvre Museum.';

% Encode the question and context using UTF-8
question_encoded = unicode2native(question, 'UTF-8');
context_encoded = unicode2native(context, 'UTF-8');

% Generate the answer using ChatGPT
url = 'https://api.openai.com/v1/engines/davinci-codex/completions';
options = weboptions('HeaderFields', {'Content-Type' 'application/json', 'Authorization' ['Bearer ' apikey]});
data = struct('prompt', [question_encoded context_encoded], 'max_tokens', 1000);
response = webwrite(url, data, options);
text_encoded = response.choices(1).text;
text = native2unicode(text_encoded, 'UTF-8');

% Display the answer
disp(text);
