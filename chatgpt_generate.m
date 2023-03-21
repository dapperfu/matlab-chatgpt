% Replace YOUR_API_KEY with your OpenAI API key
apikey = 'YOUR_API_KEY';

% Specify the prompt and number of tokens to generate
prompt = 'Hello, my name is ';
num_tokens = 50;

% Encode the prompt using UTF-8
prompt_encoded = unicode2native(prompt, 'UTF-8');

% Generate the text using ChatGPT
url = 'https://api.openai.com/v1/engines/davinci-codex/completions';
options = weboptions('HeaderFields', {'Content-Type' 'application/json', 'Authorization' ['Bearer ' apikey]});
data = struct('prompt', prompt_encoded, 'max_tokens', num_tokens);
response = webwrite(url, data, options);
text_encoded = response.choices(1).text;
text = native2unicode(text_encoded, 'UTF-8');

% Display the generated text
disp(text);
