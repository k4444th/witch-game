extends Node2D

# Nodes (onready)
@onready var tileNode := $Tile
@onready var cursorNode := $Cursor

# Enums
enum CornerType {
	GRASS,
	PATH,
	FIELD
}

# Tile Types
var tiledata := [
	[
		[
			[
				[CornerType.FIELD, CornerType.FIELD],
				[CornerType.GRASS, CornerType.FIELD],
			],
			[
				[CornerType.FIELD, CornerType.GRASS],
				[CornerType.FIELD, CornerType.GRASS],
			],
			[
				[CornerType.GRASS, CornerType.FIELD],
				[CornerType.GRASS, CornerType.GRASS],
			],
			[
				[CornerType.FIELD, CornerType.FIELD],
				[CornerType.GRASS, CornerType.GRASS],
			]
		],
		[
			[
				[CornerType.GRASS, CornerType.FIELD],
				[CornerType.FIELD, CornerType.GRASS],
			],
			[
				[CornerType.FIELD, CornerType.GRASS],
				[CornerType.GRASS, CornerType.GRASS],
			],
			[
				[CornerType.GRASS, CornerType.GRASS],
				[CornerType.GRASS, CornerType.GRASS],
			],
			[
				[CornerType.GRASS, CornerType.GRASS],
				[CornerType.GRASS, CornerType.FIELD],
			]
		],
		[
			[
				[CornerType.FIELD, CornerType.GRASS],
				[CornerType.FIELD, CornerType.FIELD],
			],
			[
				[CornerType.GRASS, CornerType.GRASS],
				[CornerType.FIELD, CornerType.FIELD],
			],
			[
				[CornerType.GRASS, CornerType.GRASS],
				[CornerType.FIELD, CornerType.GRASS],
			],
			[
				[CornerType.GRASS, CornerType.FIELD],
				[CornerType.GRASS, CornerType.FIELD],
			]
		],
		[
			[
				[CornerType.FIELD, CornerType.FIELD],
				[CornerType.FIELD, CornerType.FIELD],
			],
			[
				[CornerType.FIELD, CornerType.FIELD],
				[CornerType.FIELD, CornerType.GRASS],
			],
			[
				[CornerType.FIELD, CornerType.GRASS],
				[CornerType.GRASS, CornerType.FIELD],
			],
			[
				[CornerType.GRASS, CornerType.FIELD],
				[CornerType.FIELD, CornerType.FIELD],
			]
		]
	],
	[
		[
			[
				[CornerType.PATH, CornerType.PATH],
				[CornerType.GRASS, CornerType.PATH],
			],
			[
				[CornerType.PATH, CornerType.GRASS],
				[CornerType.PATH, CornerType.GRASS],
			],
			[
				[CornerType.GRASS, CornerType.PATH],
				[CornerType.GRASS, CornerType.GRASS],
			],
			[
				[CornerType.PATH, CornerType.PATH],
				[CornerType.GRASS, CornerType.GRASS],
			]
		],
		[
			[
				[CornerType.GRASS, CornerType.PATH],
				[CornerType.PATH, CornerType.GRASS],
			],
			[
				[CornerType.PATH, CornerType.GRASS],
				[CornerType.GRASS, CornerType.GRASS],
			],
			[
				[CornerType.GRASS, CornerType.GRASS],
				[CornerType.GRASS, CornerType.GRASS],
			],
			[
				[CornerType.GRASS, CornerType.GRASS],
				[CornerType.GRASS, CornerType.PATH],
			]
		],
		[
			[
				[CornerType.PATH, CornerType.GRASS],
				[CornerType.PATH, CornerType.PATH],
			],
			[
				[CornerType.GRASS, CornerType.GRASS],
				[CornerType.PATH, CornerType.PATH],
			],
			[
				[CornerType.GRASS, CornerType.GRASS],
				[CornerType.PATH, CornerType.GRASS],
			],
			[
				[CornerType.GRASS, CornerType.PATH],
				[CornerType.GRASS, CornerType.PATH],
			]
		],
		[
			[
				[CornerType.PATH, CornerType.PATH],
				[CornerType.PATH, CornerType.PATH],
			],
			[
				[CornerType.PATH, CornerType.PATH],
				[CornerType.PATH, CornerType.GRASS],
			],
			[
				[CornerType.PATH, CornerType.GRASS],
				[CornerType.GRASS, CornerType.PATH],
			],
			[
				[CornerType.GRASS, CornerType.PATH],
				[CornerType.PATH, CornerType.PATH],
			]
		]
	]
]
