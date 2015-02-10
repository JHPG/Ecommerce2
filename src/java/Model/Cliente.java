package Model;

public class Cliente {
    private String nome;
    private String login;
    private String senha;
    private String CPF;
    private String end;
    private String cidade;

    public Cliente(String nome, String login, String senha, String CPF, String end, String cidade) {
        this.nome = nome;
        this.login = login;
        this.senha = senha;
        this.CPF = CPF;
        this.end = end;
        this.cidade = cidade;
    }

    
    
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    //Talvez precise construtor
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCPF() {
        return CPF;
    }

    public void setCpf(String CPF) {
        this.CPF = CPF;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    
    
    
    
}
