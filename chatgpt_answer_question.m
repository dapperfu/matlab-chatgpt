% Read the API key from a text file
apikey = fileread('api_key.txt');

% Specify the question and context in which it should be answered
question = 'What is the capital of France?';
context = 'France is a country in Europe with a population of over 67 million people. Its official language is French and its currency is the euro. France is known for its iconic landmarks such as the Eiffel Tower and the Louvre Museum.';

% Generate the answer using ChatGPT
url = 'https://api.openai.com/v1/completions';

% Specify options for the web request
header_fields = {'Content-Type' 'application/json'; 'Authorization' ['Bearer ' apikey]};
options = weboptions('HeaderFields', header_fields, 'Timeout', 60);

% Specify the prompt, number of tokens to generate, and model to use
data = struct('prompt', [question context], 'max_tokens', 1000, 'model', 'text-davinci-003');

% Send the request to ChatGPT and get the response
response = webwrite(url, data, options);
text_encoded = response.choices(1).text;
text = char(text_encoded);

% Display the answer
disp(text);