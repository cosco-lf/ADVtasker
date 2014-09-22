<? include $header; ?>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="jumbotron">
                <h1>Добро пожаловать!</h1>
                <p>Пожалуйста, введите логин и пароль!</p>

            </div>
        </div>

    </div>
    <div class="row">
        <form class="form-inline" role="form">
        <div class="form-group">
            <label for="exampleInputLogin1">Логин</label>
            <input type="email" class="form-control" id="exampleInputLogin1" placeholder="Введите логин">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Пароль</label>
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Введите пароль">
        </div>

        <button type="submit" class="btn btn-default">ОК</button>
    </form>
    </div>
</div>
<? include $footer; ?>