<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $user app\models\User */

$this->title = $user->username;
?>

<h1><?= Html::encode($this->title) ?></h1>

<p><?= Html::a('Update', ['update', 'id' => $user->id], ['class' => 'btn btn-primary']) ?></p>
<p><?= Html::a('Delete', ['delete', 'id' => $user->id], [
    'class' => 'btn btn-danger',
    'data' => [
        'confirm' => 'Are you sure you want to delete this item?',
        'method' => 'post',
    ],
]) ?></p>

<div class="table-responsive">
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <td><?= $user->id ?></td>
        </tr>
        <tr>
            <th>Username</th>
            <td><?= Html::encode($user->username) ?></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><?= Html::encode($user->email) ?></td>
        </tr>
        <tr>
            <th>Status</th>
            <td><?= $user->status ?></td>
        </tr>
        <tr>
            <th>Roles</th>
            <td><?= implode(', ', array_column($user->roles, 'name')) ?></td>
        </tr>
    </table>
</div>
