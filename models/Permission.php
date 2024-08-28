<?php

namespace app\models;

use yii\db\ActiveRecord;

class Permission extends ActiveRecord
{
    public static function tableName()
    {
        return 'permission';
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

    public function getRoles()
    {
        return $this->hasMany(Role::class, ['id' => 'role_id'])
            ->viaTable('role_permission', ['permission_id' => 'id']);
    }
}
