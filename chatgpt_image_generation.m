% Load the API key from a text file
api_key = fileread('api_key.txt');

% Set the API endpoint
api_endpoint = 'https://api.openai.com/v1/images/generations';

% Set the model and parameters
model = 'image-alpha-001';
prompt = 'a bird sitting on a branch';
num_images = 1;
size = '512x512';
response_format = 'url';

% Construct the request data
request_data = struct(...
    'model', model, ...
    'prompt', prompt, ...
    'num_images', num_images, ...
    'size', size, ...
    'response_format', response_format ...
);

% Convert the request data to JSON
request_json = jsonencode(request_data);

% Send the request to the API endpoint
headers = {'Authorization', ['Bearer ' api_key]};
options = weboptions('HeaderFields', headers, 'RequestMethod', 'post', 'MediaType', 'application/json', 'Timeout', 120);
response = webwrite(api_endpoint, request_json, options);

% Write the image to disk
image_url = response.data(1).url;
image_data = webread(image_url);
image_filename = 'generated_image.png';
imwrite(image_data, image_filename);

% Display the image
imshow(image_data);