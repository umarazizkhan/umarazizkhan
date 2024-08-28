<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%permission}}`.
 */
class m240826_220744_create_permission_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    

    /*for adding and assign permissions*/

     public function up()
    {
        $this->createTable('{{%permission}}', [
            'id' => $this->primaryKey(),
            'name' => $this->string()->notNull()->unique(),
            'description' => $this->text(),
        ]);

        $this->createTable('{{%role_permission}}', [
            'role_id' => $this->integer(),
            'permission_id' => $this->integer(),
            'PRIMARY KEY(role_id, permission_id)',
        ]);

        $this->addForeignKey(
            'fk-role_permission-role_id',
            '{{%role_permission}}',
            'role_id',
            '{{%role}}',
            'id',
            'CASCADE'
        );

        $this->addForeignKey(
            'fk-role_permission-permission_id',
            '{{%role_permission}}',
            'permission_id',
            '{{%permission}}',
            'id',
            'CASCADE'
        );
    }

    public function down()
    {
        $this->dropTable('{{%role_permission}}');
        $this->dropTable('{{%permission}}');
    }
}
