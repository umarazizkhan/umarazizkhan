<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use app\models\User;
use app\models\Role;

class UserController extends Controller
{

    public function behaviors()
    {
        return [
            'access' => [
                'class' => \yii\filters\AccessControl::class,
                'rules' => [
                    [
                        'actions' => ['index', 'view' ],
                        'allow' => true,
                        'roles' => ['@'],  // Allow logged-in users
                ],
                [
                    'actions' => ['create' ,'update','delete' ],
                    'allow' => true,
                    'roles' => ['admin'],  // Only allow 'admin' users
                ],
            ],
        ],
    ];
}



public function actionIndex()
{
    $users = User::find()->all();
    return $this->render('index', ['users' => $users]);
}

public function actionView($id)
{
    $user = User::findOne($id);
    return $this->render('view', ['user' => $user]);
}

public function actionCreate()
{
    $model = new User();
    if ($model->load(Yii::$app->request->post())) {
        $model->setPassword($model->password);
        $model->generateAuthKey();
        if ($model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }
    }
    return $this->render('create', ['model' => $model]);
}

public function actionUpdate($id)
{
    $model = User::findOne($id);

    if ($model->load(Yii::$app->request->post())) {
        
        if (!empty($model->password)) {
            $model->setPassword($model->password);
        }
        
        if ($model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }
    }
    return $this->render('update', ['model' => $model]);
}

public function actionDelete($id)
{
    User::findOne($id)->delete();
    return $this->redirect(['index']);
}
}
