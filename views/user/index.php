<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $users app\models\User[] */

$this->title = 'Users';
?>

<h1><?= Html::encode($this->title) ?></h1>

<p><?= Html::a('Create User', ['create'], ['class' => 'btn btn-success']) ?></p>

<table class="table table-responsive table-bordered">
    <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($users as $user): ?>
        <tr>
            <td><?= $user->id ?></td>
            <td><?= Html::encode($user->username) ?></td>
            <td><?= Html::encode($user->email) ?></td>
            <td><?= $user->status ?></td>
            <td>
                <?= Html::a('View', ['view', 'id' => $user->id], ['class' => 'btn btn-info']) ?>
                <?= Html::a('Update', ['update', 'id' => $user->id], ['class' => 'btn btn-primary']) ?>
                <?= Html::a('Delete', ['delete', 'id' => $user->id], [
                    'class' => 'btn btn-danger',
                    'data' => [
                        'confirm' => 'Are you sure you want to delete this item?',
                        'method' => 'post',
                    ],
                ]) ?>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>
