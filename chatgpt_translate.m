% Read the API key from a text file
apikey = fileread('api_key.txt');

% Specify the source and target languages, and the text to be translated
source_lang = 'en';
target_lang = 'es';
text_to_translate = 'Hello, how are you?';

% Generate text using ChatGPT
url = 'https://api.openai.com/v1/translate';

% Specify options for the web request
header_fields = {'Content-Type' 'application/json'; 'Authorization' ['Bearer ' apikey]};
options = weboptions('HeaderFields', header_fields, 'Timeout', 60);

% Specify the model to use and the text to be translated
data = struct('text', text_to_translate, 'target_language', target_lang, 'source_language', source_lang, 'model', 'text-davinci-003');

% Send the request to ChatGPT and get the response
response = webwrite(url, data, options);
translated_text_encoded = response.translations.text;
translated_text = char(translated_text_encoded);

% Display the translated text
disp(translated_text);
