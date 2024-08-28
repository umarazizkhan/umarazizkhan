<?php

namespace app\models;

use yii\db\ActiveRecord;

class Role extends ActiveRecord
{
    public static function tableName()
    {
        return 'role';
    }

    public function rules()
    {
        return [
            [['name'], 'required'],
            [['name'], 'unique'],
            [['description'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
        ];
    }

    public function getUsers()
    {
        return $this->hasMany(User::class, ['id' => 'user_id'])
            ->viaTable('user_role', ['role_id' => 'id']);
    }

    public function getPermissions()
    {
        return $this->hasMany(Permission::class, ['id' => 'permission_id'])
            ->viaTable('role_permission', ['role_id' => 'id']);
    }

        public static function getRoles()
    {
        return self::find()->all();
    }
}
