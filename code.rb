require 'uri'
require 'json'
require 'net/http'
require 'pry-byebug'

# POST REQUEST AND GET ACCESS TOKEN

url = URI('http://cloud02.sophia.com.br:26000/apiSCL/4375/Api/v1/Autenticacao')

http = Net::HTTP.new(url.host, url.port)
request = Net::HTTP::Post.new(url)
request['Content-Type'] = 'application/json'
request.body = JSON.dump({ 'usuario': 'API Teste', 'senha': 'Dr@131483' })

response = http.request(request)
# puts response.read_body
@oldtoken = response.read_body
@newtoken = JSON.parse(@oldtoken)

# GET USUÁRIOS

# url = URI('http://cloud02.sophia.com.br:26000/apiSCL/4375/Api/v1/Colaborador?&NomeColaborador=Diego Ribeiro')

# http = Net::HTTP.new(url.host, url.port)
# request = Net::HTTP::Get.new(url)
# request['Accept'] = 'application/json'
# request['Content-Type'] = 'application/javascript'
# request['Token'] = @newtoken
# request.body = '{\'usuario\': \'API Teste\',\'senha\': \'Dr@131483\'}'

# response = http.request(request)
# puts response.read_body

# POST USUÁRIOS EM CLIENTES

url = URI('http://cloud02.sophia.com.br:26000/apiSCL/4375/Api/v1/Usuario/')

http = Net::HTTP.new(url.host, url.port)
request = Net::HTTP::Post.new(url)
request['Accept'] = 'application/json'
request['Content-Type'] = 'application/json'
request['Token'] = @newtoken
request.body = JSON.dump({
  'Nome': 'API TESTE',
  'Nascimento': '1988-07-15T00:00:00',
  'Sexo': 'F',
  'Cpf': '137.079.377-47',
  'Rg': '212768808',
  'Endereco': 'Estrada dos Bandeirantes',
  'Numero': '15501',
  'Complemento': '308',
  'Bairro': 'Vargem Pequena',
  'Cidade': 'Rio de Janeiro',
  'Uf': 'RJ',
  'Cep': '22743-051',
  'Telefone': '',
  'Email': 'saraiva.lapau@gmail.com',
  'Senha': 'ana@1508',
  'AlunoResponsavel': true,
  'ParentescoResponsavelAluno': '',
  'NomeResponsavel': 'Antonio Silva',
  'NascimentoResponsavel': '0001-01-01T00:00:00',
  'CpfResponsavel': '',
  'RgResponsavel': '',
  'EnderecoResponsavel': '',
  'NumeroEnderecoResponsavel': nil,
  'ComplementoEnderecoResponsavel': nil,
  'BairroResponsavel': '',
  'CidadeResponsavel': '',
  'UfResponsavel': nil,
  'CepResponsavel': '',
  'TelefoneResponsavel': '',
  'EnderecoAlunoIgualResponsavel': false
})

response = http.request(request)
puts response.read_body
