% Read the API key from a text file
apikey = fileread('api_key.txt');

% Specify the prompt and number of tokens to generate
prompt = 'Once upon a time, ';
num_tokens = 50;

% Generate text using ChatGPT
url = 'https://api.openai.com/v1/completions';

% Specify options for the web request
header_fields = {'Content-Type' 'application/json'; 'Authorization' ['Bearer ' apikey]};
options = weboptions('HeaderFields', header_fields, 'Timeout', 60);

% Specify the model to use and the number of tokens to generate
data = struct('prompt', prompt, 'max_tokens', num_tokens, 'model', 'text-davinci-003');

% Send the request to ChatGPT and get the response
response = webwrite(url, data, options);
text_encoded = response.choices(1).text;
text = char(text_encoded);

% Display the generated text
disp(text);